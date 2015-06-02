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
cd /opt/app/frontend

# install composer
if [ -f /opt/app/composer.json ] ; then
    if [ ! -f composer.phar ] ; then
        curl -sS https://getcomposer.org/installer | php
    fi
    php ../composer.phar install
fi
php ../composer.phar self-update

## install npm, bower & gulp
wget https://www.npmjs.org/install.sh
sudo bash ./install.sh
sudo npm install -g gulp
sudo npm install -g bower
sudo npm install

## install bower & gulp
bower install
gulp

# link storage folder 
rm -rf /opt/app/frontend/app/storage
ln -s /var/storage /opt/app/frontend/app
