#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y nginx php5-fpm php5-mysql mariadb-server
apt-get install -y php5-gd 
apt-get install -y php5-mcrypt
#sudo php5enmod mcrypt
sudo unlink /etc/nginx/sites-enabled/default
cat > /etc/nginx/sites-available/sandstorm-php <<EOF
upstream php-handler {
  server unix:/var/run/php5-fpm.sock;
}
server {
  listen 8000 default_server;
  listen [::]:8000 default_server ipv6only=on;

  server_name localhost;
  root /opt/app/frontend/public;
  
  include mime.types;
  default_type application/octet-stream;
  sendfile on;
  keepalive_timeout 65;
  client_max_body_size 1000M;
  location / {
    index index.html index.htm index.php;
    try_files $uri $uri/ /index.php;
  }
  location ~ \.php$ {
    try_files $uri = 404;
    fastcgi_index index.php;
    include fastcgi_params;
  } 
}
EOF
sudo ln -s /etc/nginx/sites-available/sandstorm-php /etc/nginx/sites-enabled/sandstorm-php
sudo service nginx stop
sudo service php5-fpm stop
sudo service mysql stop
# patch /etc/php5/fpm/php-fpm.conf to not change uid/gid to www-data
sed --in-place='' \
        --expression='s/^listen.owner = www-data/#listen.owner = www-data/' \
        --expression='s/^listen.group = www-data/#listen.group = www-data/' \
        --expression='s/^user = www-data/#user = www-data/' \
        --expression='s/^group = www-data/#group = www-data/' \
        /etc/php5/fpm/pool.d/www.conf
# patch mysql conf to not change uid
sed --in-place='' \
        --expression='s/^user\t\t= mysql/#user\t\t= mysql/' \
        /etc/mysql/my.cnf

## minimize mysql allocations
# echo '[mysqld]\ninnodb_data_file_path = ibdata1:10M:autoextend\ninnodb_log_file_size = 10KB\ninnodb_file_per_table = 1' > /etc/mysql/conf.d/small.cnf
# sed -i 's_^socket\s*=.*_socket = /tmp/mysqld.sock_g' /etc/mysql/*.cnf && ln -s /tmp/mysqld.sock /var/run/mysqld/mysqld.sock
# rm -rf /var/lib/mysql/* && mysql_install_db && chown -R mysql: /var/lib/mysql

## initial paperwork DB
# /usr/sbin/mysqld & \
# sleep 10s &&\
# echo "DROP DATABASE IF EXISTS paperwork; CREATE DATABASE IF NOT EXISTS paperwork DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; GRANT ALL PRIVILEGES ON paperwork.* TO 'paperwork'@'localhost' IDENTIFIED BY 'paperwork' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql

## patch nginx conf to not bother trying to setuid, since we're not root
sed --in-place='' \
        --expression 's/^user www-data/#user www-data/' \
        --expression 's#^pid /run/nginx.pid#pid /var/run/nginx.pid#' \
        /etc/nginx/nginx.conf
