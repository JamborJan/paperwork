#!/bin/bash
cp -r /etc/service /tmp
test -d /var/log || cp -r /var_original/log /var
test -d /var/lib || cp -r /var_original/lib /var
test -d /var/run || cp -r /var_original/run /var
test -f /var/lock || ln -s /var/run/lock /var/lock
test -f /var/cache || cp -r /opt/app/cache /var
test -d /var/lib/nginx || cp -r /var_original/lib/nginx /var/lib
test -d /var/log/nginx || cp -r /var_original/log/nginx /var/log
test -f /var/feed-icons || cp -r /opt/app/feed-icons-old /var/feed-icons
rm -f /var/run/mysqld/mysqld.sock && ln -s /tmp/mysqld.sock /var/run/mysqld/mysqld.sock

# update
bash -c 'sleep 20 && /usr/bin/php5 /opt/app/update.php --feeds --force-update' 2>&1 &

/sbin/my_init
