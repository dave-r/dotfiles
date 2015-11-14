#!/bin/bash

# install git

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# backup existing dotfile
[[ -f ~/.gitconfig ]] && mv ~/.gitconfig ~/.backup-gitconfig-backup

# install
# commented out because git has to already be installed to retrieve this file from github!
# no need to install again, just configure
# apt-get install git

# link settings dotfile
ln -s $SCRIPT_DIR/../git/.gitconfig ~/.gitconfig
chmod 700 ~/.gitconfig
