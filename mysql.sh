#!/bin/bash
mkdir -p /var/db
exec /usr/sbin/mysqld >>/var/log/mysql.log 2>&1
