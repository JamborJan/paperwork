# Paperwork Sandstorm package

This is the Sandstorm package of [Paperwork](http://paperwork.rocks/).

# Status

Version 3 of the app can be used for testing it's not 100% stable but should work pretty well. Please add issues and questions you have as Issue here on [Github](https://github.com/JamborJan/paperwork/issues).

Version 4 is work in progress and the current code is not working at all. See the issues list filtered by label v4 for the issues which are included in this version.

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
    # we dont do ```vagrant-spk setupvm lemp``` as we are using the
    # files in the cloned repo
    # edit .sandstorm/setup.sh in your editor of choice
    # to change what packages should be installed in the next step
    vagrant-spk up
    # we dont do ```vagrant-spk init``` 
    # edit .sandstorm/sandstorm-pkgdef.capnp in your editor of choice
    # make sure you have the Sandstorm key file for the app
    vagrant-spk dev
    # visit http://localhost:6080 in a web browser
    # launch an instance of the ownCloud app, play around with it
    # then, press Ctrl-C to stop the tracing vagrant-spk dev
    vagrant-spk pack owncloud.spk
    # You now have an .spk file.  Yay!
