#!/bin/bash
set -eu
echo localhost > /etc/hostname
hostname localhost
curl https://install.sandstorm.io/ > install.sh
bash install.sh -d -e
modprobe ip_tables
# Make the vagrant user part of the sandstorm group so that commands like
# `spk dev` work.
usermod -a -G 'sandstorm' 'vagrant'
# TODO: update sandstorm installer script to ask about dev accounts, and
# specify a value for this option in the default config?
if ! grep --quiet --no-messages ALLOW_DEV_ACCOUNTS=true /opt/sandstorm/sandstorm.conf ; then
    echo "ALLOW_DEV_ACCOUNTS=true" | sudo tee -a /opt/sandstorm/sandstorm.conf
    sudo service sandstorm restart
fi
