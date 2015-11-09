#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# remove existing dotfiles
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.backup-bashrc-backup
[[ -f ~/.bash_aliases ]] && mv ~/.bash_aliases ~/.backup-bash_aliases-backup

# link dotfiles
ln -s $SCRIPT_DIR/.bashrc ~/.bashrc
ln -s $SCRIPT_DIR/.bash_aliases ~/.bash_aliases

# set permissions
chmod 700 ~/.bashrc
chmod 700 ~/.bash_aliases

