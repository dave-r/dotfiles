#!/bin/bash

# get the user name (not the root user running the script)
# TODO : makes a bad assumption that there is only 1 user
USERNAME=$(find /home/* -maxdepth 0 -printf "%f" -type d)

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install docker
curl -sSL https://get.docker.com/ | sh

# link docker dot file
if [[ -f $SCRIPT_DIR/../docker/.dockerrc ]]
    then
        [[ -f $HOME/.dockerrc ]] && mv $HOME/.dockerrc $HOME/.backup-dockerrc-backup
        ln -s $SCRIPT_DIR/../docker/.dockerrc $HOME/.dockerrc
        chmod 700 $HOME/.dockerrc
fi

# add user to docker group
sudo usermod -aG docker $USERNAME
