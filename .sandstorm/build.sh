#!/bin/bash
# Checks if there's a composer.json, and if so, installs/runs composer.

set -euo pipefail

# Setup composer
cd /opt/app/paperwork/frontend

if [ -f /opt/app/paperwork/frontend/composer.json ] ; then
    if [ ! -f composer.phar ] ; then
        curl -sS https://getcomposer.org/installer | php
    fi
    php composer.phar install
fi
php composer.phar self-update

# Install paperwork's npm dependencies
npm install

# Install bower dependencies
bower install

# Run gulp to build static assets
gulp

# link storage folder
rm -rf /opt/app/paperwork/frontend/app/storage
rm -rf /var/storage
ln -s /var/storage /opt/app/paperwork/frontend/app

# Some files needed to be changed for ruinning Paperwork on Sandstorm
cp -rf /opt/app/changedfiles/frontend/* /opt/app/paperwork/frontend
