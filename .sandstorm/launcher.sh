#!/bin/bash

# Create a bunch of folders under the clean /var that php, nginx, and mysql expect to exist
mkdir -p /var/lib/mysql
mkdir -p /var/lib/nginx
mkdir -p /var/log
mkdir -p /var/log/mysql
mkdir -p /var/log/nginx
mkdir -p /var/run
mkdir -p /var/run/mysqld

# Ensure mysql tables created
HOME=/etc/mysql /usr/bin/mysql_install_db --force
# insert default ownCloud db_structure
mysql -u root owncloud < /opt/app/initial_database.sql

# Spawn php, mysqld, and nginx.
/usr/sbin/php5-fpm --nodaemonize --fpm-config /etc/php5/fpm/php-fpm.conf &
HOME=/etc/mysql /usr/sbin/mysqld &
# TODO: wait for mysql and php5-fpm to be satisfactorily up before spawning
# nginx, to avoid 502s while the backend comes up?
# (systemd would do this nicely for us with socket activation...)
/usr/sbin/nginx -g "daemon off;"
