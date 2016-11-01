#!/bin/bash

#
# install i3 window manager on fedora
#

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

if [[ ! -v username ]]; then
    # get the user name (not the root user running the script)
    username=""
    . $SCRIPT_DIR/getusername.sh
    getuser

    HOMEDIR="/home/$username"

    export username
    export HOMEDIR
fi

# install i3
dnf -y install i3

# make sure the directory exists
[[ ! -f $HOMEDIR/.config/i3 ]] && mkdir -p $HOMEDIR/.config/i3

# backup existing config files 
[[ -f $HOMEDIR/.config/i3/config ]] && mv $HOMEDIR/.config/i3/config $HOMEDIR/.config/i3/.backup-config-backup
[[ -f $HOMEDIR/.config/i3/i3status.conf ]] && mv $HOMEDIR/.config/i3/status.conf $HOME/.config/i3/.backup-i3status.conf-backup
[[ -f $HOMEDIR/.xinitrc ]] && mv $HOMEDIR/.xinitrc $HOMEDIR/.backup-xinitrc-backup

ln -s $SCRIPT_DIR/../i3/config $HOMEDIR/.config/i3/config
ln -s $SCRIPT_DIR/../i3/i3status.conf $HOMEDIR/.config/i3/i3status.conf
ln -s $SCRIPT_DIR/../i3/.xinitrc $HOMEDIR/.xinitrc

