#!/bin/bash
# Checks if there's a composer.json, and if so, installs/runs composer.

set -euo pipefail

cd /opt/app/frontend

if [ -f /opt/app/frontend/composer.json ] ; then
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
rm -rf /opt/app/frontend/app/storage
rm -rf /var/storage
ln -s /var/storage /opt/app/frontend/app
