#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

cd $HOME

# 1st, backup existing dotfiles
#tar -cf $HOME/dotfiles-backup.tar $HOME/.bashrc $HOME/.bash_profile $HOME/.dockerrc $HOME/.gitconfig

# remove existing dotfiles
[[ -f $HOME/.bashrc ]] && rm -f $HOME/.bashrc
[[ -f $HOME/.bash_profile ]] && rm -f $HOME/.bash_profile
[[ -f $HOME/.dockerrc ]] && rm -f $HOME/.dockerrc
[[ -f $HOME/.coreosrc ]] && rm -f $HOME/.coreosrc
[[ -f $HOME/.gitconfig ]] && rm -f $HOME/.gitconfig

# link dotfiles
ln -s $SCRIPT_DIR/.bashrc $HOME/.bashrc
ln -s $SCRIPT_DIR/.bash_profile $HOME/.bash_profile
ln -s $SCRIPT_DIR/.dockerrc $HOME/.dockerrc
ln -s $SCRIPT_DIR/.coreosrc $HOME/.coreosrc
ln -s $SCRIPT_DIR/../git/.gitconfig $HOME/.gitconfig

# set permissions
chmod 700 $HOME/.bashrc
chmod 700 $HOME/.bash_profile
chmod 700 $HOME/.dockerrc
chmod 700 $HOME/.coreosrc
chmod 700 $HOME/.gitconfig
