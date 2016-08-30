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

# remove existing dotfiles
[[ -f $HOME/.bashrc ]] && mv $HOME/.bashrc $HOME/.backup-bashrc-backup
[[ -f $HOME/.bash_aliases ]] && mv $HOME/.bash_aliases $HOME/.backup-bash_aliases-backup
[[ -f $HOME/.Xresources ]] && mv $HOME/.Xresources $HOME/.backup-xresources-backup

# link dotfiles
ln -s $SCRIPT_DIR/.bashrc $HOME/.bashrc
ln -s $SCRIPT_DIR/.bash_aliases $HOME/.bash_aliases
ln -s $SCRIPT_DIR/.Xresources $HOME/.Xresources

# set permissions
chmod 700 $HOME/.bashrc
chmod 700 $HOME/.bash_aliases
chmod 700 $HOME/.Xresources

# set up sudo so we don't have to enter password every time
sudo ./setup-sudo.sh

# install fonts
[[ -z $HOME/.fonts ]] && mkdir $HOME/.fonts
cp -r $SCRIPT_DIR/../fonts/* $HOME/.fonts/

# set up dir colors
[[ -f $HOME/.dircolors && -f $SCRIPT_DIR/../.dircolors ]] && mv $HOME/.dircolors $HOME/.backup-dircolors-backup
[[ -f $SCRIPT_DIR/../.dircolors ]] && cp $SCRIPT_DIR/../.dircolors $HOME/

# install apps
$SCRIPT_DIR/install-utils.sh
$SCRIPT_DIR/install-go.sh
$SCRIPT_DIR/install-i3.sh
$SCRIPT_DIR/install-sublime.sh
$SCRIPT_DIR/install-chrome.sh
$SCRIPT_DIR/install-docker.sh


