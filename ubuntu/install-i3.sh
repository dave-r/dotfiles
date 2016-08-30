#!/bin/bash

echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list.d/i3.list
apt-get update
apt-get --allow-unauthenticated install sur5r-keyring
apt-get update
apt-get install i3
apt-get install xinit

[[ -z $HOME/.config/i3 ]] && mkdir -p $HOME/.config/i3
ln -s $SCRIPT_DIR/../i3/config $HOME/.config/i3/config
ln -s $SCRIPT_DIR/../i3/i3status.conf $HOME/.config/i3/i3status.conv

