#!/bin/bash
# Checks if there's a composer.json, and if so, installs/runs composer.

set -euo pipefail

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

# Some files needed to be changed for ruinning Paperwork
# on Sandstorm. We copy these in the repository
cp /opt/app/changedfiles/paperwork.php /opt/app/paperwork/frontend/app/config/paperwork.php
cp /opt/app/changedfiles/UserController.php /opt/app/paperwork/frontend/app/controllers/UserController.php
cp /opt/app/changedfiles/routes.php /opt/app/paperwork/frontend/app/routes.php
cp /opt/app/changedfiles/debug.blade.php /opt/app/paperwork/frontend/app/views/user/debug.blade.php
