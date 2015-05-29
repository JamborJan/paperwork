#!/bin/bash
# This is a script that is run every time you call "vagrant-spk dev".
# It is intended to do platform-and-repository-specific build steps.  You
# might customize it to do any of the following, or more:
# - for Python, prepare a virtualenv and pip install -r requirements.txt
# - for PHP, call composer to retrieve additional packages
# - for JS/CSS/SASS/LESS, compile, minify, or otherwise do asset pipeline work.
# This particular script does nothing at present, but you should adapt it
# sensibly for your package.
# Checks if there's a composer.json, and if so, installs/runs composer.

set -eu
cd /opt/app

if [ -f /opt/app/composer.json ] ; then
    if [ ! -f composer.phar ] ; then
        curl -sS https://getcomposer.org/installer | php
    fi
    php composer.phar install
fi
php composer.phar self-update

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
# test only bc/ the error message says its looking in /meta for the json file
if  test -d /meta ; then
   sudo rm -R /meta
fi
sudo ln -s /var/storage/meta /
