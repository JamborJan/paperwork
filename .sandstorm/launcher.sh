#!/bin/bash

# Create a bunch of folders under the clean /var that php, nginx, and mysql expect to exist
mkdir -p /var/lib/mysql
mkdir -p /var/lib/nginx
mkdir -p /var/log
mkdir -p /var/log/mysql
mkdir -p /var/log/nginx
# Wipe /var/run, since pidfiles and socket files from previous launches should go away
# TODO someday: I'd prefer a tmpfs for these.
rm -rf /var/run
mkdir -p /var/run
mkdir -p /var/run/mysqld

# move storage folders which must be writable to /var
mkdir -p /var/storage
mkdir -p /var/storage/attachments
mkdir -p /var/storage/cache
mkdir -p /var/storage/logs
mkdir -p /var/storage/meta
mkdir -p /var/storage/sessions
mkdir -p /var/storage/views
# cp /opt/app/services.json /var/storage/meta/services.json

# Ensure mysql tables created
HOME=/etc/mysql /usr/bin/mysql_install_db --force

# Update V3 to V4 mysqld.sock
# minimize mysql allocations
# echo '[mysqld]\ninnodb_data_file_path = ibdata1:10M:autoextend\ninnodb_log_file_size = 10KB\ninnodb_file_per_table = 1' > /etc/mysql/conf.d/small.cnf
# sed -i 's_^socket\s*=.*_socket = /tmp/mysqld.sock_g' /etc/mysql/*.cnf
# ln -s /tmp/mysqld.sock /var/run/mysqld/mysqld.sock
# rm -rf /var/lib/mysql/*
# mysql_install_db
# chown -R mysql: /var/lib/mysql

# Spawn mysqld, php
HOME=/etc/mysql /usr/sbin/mysqld &
/usr/sbin/php5-fpm --nodaemonize --fpm-config /etc/php5/fpm/php-fpm.conf &
# Wait until mysql and php have bound their sockets, indicating readiness
while [ ! -e /var/run/mysqld/mysqld.sock ] ; do
    echo "waiting for mysql to be available at /var/run/mysqld/mysqld.sock"
    sleep .2
done
while [ ! -e /var/run/php5-fpm.sock ] ; do
    echo "waiting for php5-fpm to be available at /var/run/php5-fpm.sock"
    sleep .2
done

# Ensure the paperwork database exists.
echo "CREATE DATABASE IF NOT EXISTS paperwork DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; GRANT ALL PRIVILEGES ON paperwork.* TO 'paperwork'@'localhost' IDENTIFIED BY 'paperwork' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql --user root --socket /var/run/mysqld/mysqld.sock
# Run database migrations.
time php /opt/app/frontend/artisan migrate --force

# Start nginx.
/usr/sbin/nginx -g "daemon off;"
