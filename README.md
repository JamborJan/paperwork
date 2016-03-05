# Paperwork Sandstorm package

This is the Sandstorm package of [Paperwork](http://paperwork.rocks/).

Please add issues and questions you have as Issue here on [Github](https://github.com/JamborJan/paperwork/issues).

# How to

The package is done with [vagrant-spk](https://github.com/zarvox/vagrant-spk), a tool designed to help app developers package apps for [Sandstorm](https://sandstorm.io).

You can follow the following steps to make your own package or to contribute.

## Prerequisites

You will need to install:
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Git

## Step by Step

    git clone https://github.com/zarvox/vagrant-spk
    git clone https://github.com/JamborJan/paperwork
    export PATH=$(pwd)/vagrant-spk:$PATH
    cd paperwork
    vagrant-spk vm up
    vagrant-spk dev

    visit [http://local.sandstorm.io:6080/](http://local.sandstorm.io:6080/) in a web browser

    vagrant-spk pack paperwork.spk

Note: when you want to fork this repo and create actual app packages for the app store you would need either the original app key or create a new one and make your own app.

# Old versions & export of data

Version 3 - This version is deprecated, exports are not working. To retrieve your data you will have to update to Version 4 and then export your data.

Version 4 - This version is deprecated but can be installed as update to version 3 and will show you an export screen when it detects an old grain. Afterwards you should install version 5 of the app and import the data again.
