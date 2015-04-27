# Paperwork Sandstorm package

This is the Sandstorm package of [Paperwork](http://paperwork.rocks/) 
.

# Status

This package can be used for testing it's not yet stable. Please add issues and questions you have as Issue here on [Github](https://github.com/JamborJan/paperwork/issues).

# How to

The package is done with [vagrant-spk](https://github.com/zarvox/vagrant-spk), a tool designed to help app developers package apps for [Sandstorm](https://sandstorm.io).

You can follow the following steps to make your own package or to contribute.

## Prerequisites

You will need to install:
- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Of course git

## Step by Step

    git clone git://github.com/JamborJan/vagrant-spk
    git clone https://github.com/JamborJan/paperwork
    export PATH=$(pwd)/vagrant-spk:$PATH
    cd paperwork
    vagrant-spk setupvm lemp
    vagrant-spk up
    vagrant-spk init
    # edit .sandstorm/sandstorm-pkgdef.capnp in your editor of choice
    vagrant-spk dev
    # visit http://localhost:6080 in a web browser
    # launch an instance of the ownCloud app, play around with it
    # then, press Ctrl-C to stop the tracing vagrant-spk dev
    vagrant-spk pack owncloud.spk
    # You now have an .spk file.  Yay!
