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
# We have a prepared config file
cp /opt/app/changedfiles/paperwork.php /opt/app/paperwork/frontend/app/config/paperwork.php
# This changes some routes so that we don't have login screens
cp /opt/app/changedfiles/routes.php /opt/app/paperwork/frontend/app/routes.php
# This adds Dummy users in Sandstorm mode
cp /opt/app/changedfiles/UserController.php /opt/app/paperwork/frontend/app/controllers/UserController.php
# These things are used for debugging:
cp /opt/app/changedfiles/debug-main.blade.php /opt/app/paperwork/frontend/app/views/partials/debug-main.blade.php
cp /opt/app/changedfiles/debug.blade.php /opt/app/paperwork/frontend/app/views/user/debug.blade.php
cp /opt/app/changedfiles/main.blade.php /opt/app/paperwork/frontend/app/views/main.blade.php
# Remove buttons we don't need in Sandstorm mode
cp /opt/app/changedfiles/navigation-main.blade.php /opt/app/paperwork/frontend/app/views/partials/navigation-main.blade.php
cp /opt/app/changedfiles/menu-main.blade.php /opt/app/paperwork/frontend/app/views/partials/menu-main.blade.php
