#!/bin/bash
rm -rf dockerenv
mkdir dockerenv && cd dockerenv

docker export `docker ps -l -q` | tar x

mv var var_original
rm -rf etc/service/*/supervise

cd var_original
rm lock run
cp -r ../run .
ln -s run/lock lock
cd ..

cd opt
rm -rf app/.git
mv app app_original
ln -s /var/app app
cd ../..

cp my_init dockerenv/sbin/
