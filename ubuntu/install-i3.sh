#!/bin/bash

echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list.d/i3.list
apt-get update
apt-get --allow-unauthenticated install sur5r-keyring
apt-get update
apt-get install i3
apt-get install xinit

# make sure the directory exists
[[ ! -f $HOME/.config/i3 ]] && mkdir -p $HOME/.config/i3

# backup existing config files 
[[ -f $HOME/.config/i3/config ]] && mv $HOME/.config/i3/config $HOME/.config/i3/.backup-config-backup
[[ -f $HOME/.config/i3/i3status.conf ]] && mv $HOME/.config/i3/status.conf $HOME/.config/i3/.backup-i3status.conf-backup

ln -s $SCRIPT_DIR/../i3/config $HOME/.config/i3/config
ln -s $SCRIPT_DIR/../i3/i3status.conf $HOME/.config/i3/i3status.conf

