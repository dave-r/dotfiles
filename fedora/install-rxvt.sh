#!/bin/bash

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

dnf -y install rxvt-unicode-256color

# set up conf
if [[ -f $SCRIPT_DIR/.Xresources ]]
    then 
        [[ -f $HOMEDIR/.Xresources ]] && mv $HOMEDIR/.Xresources $HOMEDIR/.backup-xresources-backup
        ln -s $SCRIPT_DIR/.Xresources $HOMEDIR/.Xresources
        chmod 700 $HOMEDIR/.Xresources
fi
