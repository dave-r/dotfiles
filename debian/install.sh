#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# remove existing dotfiles
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.backup-bashrc-backup

# link dotfiles
ln -s $SCRIPT_DIR/.bashrc ~/.bashrc

# set permissions
chmod 700 ~/.bashrc
