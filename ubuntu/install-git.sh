#!/bin/bash

# install git

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install
# commented out because git has to already be installed to retrieve this file from github!
# no need to install again, just configure
# apt-get install git

# link git dot file
if [[ -f $SCRIPT_DIR/../git/.gitconfig ]]
    then
        [[ -f $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/.backup-gitconfig-backup
            ln -s $SCRIPT_DIR/../git/.gitconfig $HOME/.gitconfig
            chmod 700 $HOME/.gitconfig
fi
