#!/bin/bash

#
# install i3 window manager on fedora
#

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install i3
dnf install i3

# make sure the directory exists
[[ ! -f $HOME/.config/i3 ]] && mkdir -p $HOME/.config/i3

# backup existing config files 
[[ -f $HOME/.config/i3/config ]] && mv $HOME/.config/i3/config $HOME/.config/i3/.backup-config-backup
[[ -f $HOME/.config/i3/i3status.conf ]] && mv $HOME/.config/i3/status.conf $HOME/.config/i3/.backup-i3status.conf-backup

ln -s $SCRIPT_DIR/../i3/config $HOME/.config/i3/config
ln -s $SCRIPT_DIR/../i3/i3status.conf $HOME/.config/i3/i3status.conf

