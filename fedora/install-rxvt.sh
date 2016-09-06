#!/bin/bash

dnf install rxvt-unicode-256color

# set up conf
if [[ -f $SCRIPT_DIR/.Xresources ]]
    then 
        [[ -f $HOMEDIR/.Xresources ]] && mv $HOMEDIR/.Xresources $HOMEDIR/.backup-xresources-backup
        ln -s $SCRIPT_DIR/.Xresources $HOMEDIR/.Xresources
        chmod 700 $HOMEDIR/.Xresources
fi
