#!/bin/bash

# install basic setup
# mostly taken from 
#  https://github.com/jfrazelle/dotfiles/blob/f82e180368c1f3f4bb32297fb023c0ad2d0563e6/bin/install.sh
#

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# get the user name (not the root user running the script)
# TODO : makes a bad assumption that there is only 1 user
USERNAME=$(find /home/* -maxdepth 0 -printf "%f" -type d)

# link bash dot files
if [[ -f $SCRIPT_DIR/.bashrc ]]
    then
        [[ -f $HOME/.bashrc ]] && mv $HOME/.bashrc $HOME/.backup-bashrc-backup
        ln -s $SCRIPT_DIR/.bashrc $HOME/.bashrc
        chmod 700 $HOME/.bashrc
fi

if [[ -f $SCRIPT_DIR/.bash_aliases ]]
    then
        [[ -f $HOME/.bash_aliases ]] && mv $HOME/.bash_aliases $HOME/.backup-bash_aliases-backup
        ln -s $SCRIPT_DIR/.bash_aliases $HOME/.bash_aliases  
        chmod 700 $HOME/.bash_aliases      
fi

if [[ -f $SCRIPT_DIR/.Xresources ]]
    then 
        [[ -f $HOME/.Xresources ]] && mv $HOME/.Xresources $HOME/.backup-xresources-backup
        ln -s $SCRIPT_DIR/.Xresources $HOME/.Xresources
        chmod 700 $HOME/.Xresources
fi

# install fonts
if [[ -d $SCRIPT_DIR/../fonts ]]
    then
        [[ ! -d $HOME/.fonts ]] && mkdir $HOME/.fonts
        cp -r $SCRIPT_DIR/../fonts/* $HOME/.fonts/
fi

# set up dir colors
if [[ -f $SCRIPT_DIR/../.dircolors ]]
    then
        [[ -f $HOME/.dircolors ]] && mv $HOME/.dircolors $HOME/.backup-dircolors-backup
        cp $SCRIPT_DIR/../.dircolors $HOME/
fi

# set up editor config
if [[ -f $SCRIPT_DIR/../.editorconfig ]]
then
    [[ -f $HOME/.editorconfig ]] && mv $HOME/.editorconfig $HOME/.backup-editorconfig-backup
    ln -s $SCRIPT_DIR/../.editorconfig $HOME/.editorconfig
fi

# set up sudo so we don't have to enter password every time
sudo ./setup-sudo.sh

# install apps
[[ -x $SCRIPT_DIR/install-utils.sh ]] && $SCRIPT_DIR/install-utils.sh
[[ -x $SCRIPT_DIR/install-go.sh ]] && $SCRIPT_DIR/install-go.sh
[[ -x $SCRIPT_DIR/install-i3.sh ]] && $SCRIPT_DIR/install-i3.sh
[[ -x $SCRIPT_DIR/install-sublime.sh ]] && $SCRIPT_DIR/install-sublime.sh
[[ -x $SCRIPT_DIR/install-chrome.sh ]] && $SCRIPT_DIR/install-chrome.sh
[[ -x $SCRIPT_DIR/install-docker.sh ]] && $SCRIPT_DIR/install-docker.sh


