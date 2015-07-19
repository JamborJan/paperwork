# Paperwork Sandstorm package

This is the Sandstorm package of [Paperwork](http://paperwork.rocks/).

# Status

Version 3 - Currently on the Sandstorm app store, will soon be updated with V5. 

Version 4 - has never been released.

Version 5 - includes a ton of fixes and cleanup and also the latest pre-release of Paperwork. It should be available through the Sandstorm app store soon. ATTENTION: updating your existing Paperwork grains does not work!!!

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
    vagrant-spk up
    vagrant-spk dev

    visit http://localhost:6080 in a web browser

    vagrant-spk pack paperwork.spk
