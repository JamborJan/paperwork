#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y nginx php5-fpm php5-mysql php5-cli php5-dev php5-gd php5-mcrypt mysql-server nodejs nodejs-legacy
php5enmod mcrypt
unlink /etc/nginx/sites-enabled/default
cat > /etc/nginx/sites-available/sandstorm-php <<EOF
server {
    listen 8000 default_server;
    listen [::]:8000 default_server ipv6only=on;

    server_name localhost;
    root /opt/app/frontend/public;

    include mime.types;
    ## default_type application/octet-stream;
    default_type text/html;
    sendfile on;
    keepalive_timeout 65;
    client_max_body_size 1000M;

    location / {
        index index.html index.htm index.php;
        try_files \$uri \$uri/ /index.php?$query_string;
    }

    location ~ \\.php\$ {
        fastcgi_split_path_info ^(.+\\.php)(/.+)\$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        try_files $uri = 404;
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
