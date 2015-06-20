# Paperwork Sandstorm package

This is the Sandstorm package of [Paperwork](http://paperwork.rocks/).

# Status

Version 3 of the app can be used for testing it's not 100% stable but should work pretty well. Please add issues and questions you have as Issue here on [Github](https://github.com/JamborJan/paperwork/issues).

Version 4 - the master branch - is work in progress. The current code should work but you might face issues and bugs. See the issues list filtered by label v4 for the issues which are included in this version.

Version 5 and it's branch is also work in progress but not working.

# How to

The package is done with [vagrant-spk](https://github.com/zarvox/vagrant-spk), a tool designed to help app developers package apps for [Sandstorm](https://sandstorm.io).

You can follow the following steps to make your own package or to contribute.

## Prerequisites

You will need to install:
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Of course git

## Step by Step

    git clone https://github.com/zarvox/vagrant-spk
    git clone https://github.com/JamborJan/paperwork
    export PATH=$(pwd)/vagrant-spk:$PATH
    cd paperwork
    vagrant-spk up
    vagrant-spk dev
    
    visit http://localhost:6080 in a web browser
