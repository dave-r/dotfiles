#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

cd ~

# 1st, backup existing dotfiles
tar -cf ~/dotfiles-backup.tar ~/.bashrc ~/.bash_profile ~/.dockerrc

# remove existing dotfiles
[[ -f ~/.bashrc ]] && rm -f ~/.bashrc
[[ -f ~/.bash_profile ]] && rm -f ~/.bash_profile
[[ -f ~/.dockerrc ]] && rm -f ~/.dockerrc

# link dotfiles
ln -s $SCRIPT_DIR/.bashrc ~/.bashrc
ln -s $SCRIPT_DIR/.bash_profile ~/.bash_profile
ln -s $SCRIPT_DIR/../docker/.dockerrc ~/.dockerrc

# set permissions
chmod 700 ~/.bashrc
chmod 700 ~/.bash_profile
chmod 700 ~/.dockerrc
