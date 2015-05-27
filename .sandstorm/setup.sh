#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y nginx php5-fpm php5-mysql php5-cli php5-dev php5-gd php5-mcrypt mysql-server
sudo php5enmod mcrypt
sudo unlink /etc/nginx/sites-enabled/default
cat > /etc/nginx/sites-available/sandstorm-php <<EOF
server {
    listen 8000 default_server;
    listen [::]:8000 default_server ipv6only=on;

    server_name localhost;
    root /opt/app/frontend/public;
    default_type text/html;

    location / {
        index index.php;
        try_files \$uri \$uri/ =404;
    }

    location ~ \\.php\$ {
        fastcgi_split_path_info ^(.+\\.php)(/.+)\$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
    }
}
EOF
ln -s /etc/nginx/sites-available/sandstorm-php /etc/nginx/sites-enabled/sandstorm-php
service nginx stop
service php5-fpm stop
service mysql stop
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
# patch nginx conf to not bother trying to setuid, since we're not root
sed --in-place='' \
        --expression 's/^user www-data/#user www-data/' \
        --expression 's#^pid /run/nginx.pid#pid /var/run/nginx.pid#' \
        /etc/nginx/nginx.conf
# Add a conf snippet providing what sandstorm-http-bridge says the protocol is as var fe_https
cat > /etc/nginx/conf.d/50sandstorm.conf << EOF
    # Trust the sandstorm-http-bridge's X-Forwarded-Proto.
    map \$http_x_forwarded_proto \$fe_https {
        default "";
        https on;
    }
EOF
# Adjust fastcgi_params to use the patched fe_https
sed --in-place='' \
        --expression 's/^fastcgi_param\tHTTPS.*$/fastcgi_param\tHTTPS\t\t\$fe_https if_not_empty;/' \
        /etc/nginx/fastcgi_params
# move storage folders which must be writable to /var
if  test -d /var/storage ; then
   sudo rm -R /var/storage
fi
sudo mkdir /var/storage
sudo mkdir /var/storage/attachments
sudo mkdir /var/storage/cache
sudo mkdir /var/storage/logs
sudo mkdir /var/storage/meta
sudo mkdir /var/storage/sessions
sudo mkdir /var/storage/views
if  test -d /opt/app/frontend/app/storage ; then
   sudo rm -R /opt/app/frontend/app/storage
fi
sudo ln -s /var/storage /opt/app/frontend/app/
sudo cp /opt/app/services.json /var/storage/meta/services.json
sudo chmod -R 777 /var/storage/
