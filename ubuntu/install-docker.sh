#!/bin/bash

# get the user name (not the root user running the script)
# TODO : makes a bad assumption that there is only 1 user
USERNAME=$(find /home/* -maxdepth 0 -printf "%f" -type d)

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install docker
curl -sSL https://get.docker.com/ | sh

# remove existing dotfiles
[[ -f $HOME/.dockerrc ]] && mv $HOME/.dockerrc $HOME/.backup-dockerrc-backup

# link dotfiles
ln -s $SCRIPT_DIR/../docker/.dockerrc $HOME/.dockerrc

# set permissions
chmod 700 $HOME/.dockerrc

# add user to docker group
sudo usermod -aG docker $USERNAME
