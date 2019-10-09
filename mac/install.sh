#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

cd $HOME

# 1st, backup existing dotfiles
#tar -cf $HOME/dotfiles-backup.tar $HOME/.bashrc $HOME/.bash_profile $HOME/.dockerrc $HOME/.gitconfig

# remove existing dotfiles, link new dotfiles from this repo and set permissions 
[[ -f $HOME/.bashrc ]] && rm -f $HOME/.bashrc && ln -s $SCRIPT_DIR/.bashrc $HOME/.bashrc && chmod 700 $HOME/.bashrc
[[ -f $HOME/.bash_profile ]] && rm -f $HOME/.bash_profile && ln -s $SCRIPT_DIR/.bash_profile $HOME/.bash_profile && chmod 700 $HOME/.bash_profile
[[ -f $HOME/.dockerrc ]] && rm -f $HOME/.dockerrc && ln -s $SCRIPT_DIR/.dockerrc $HOME/.dockerrc && chmod 700 $HOME/.dockerrc
[[ -f $HOME/.coreosrc ]] && rm -f $HOME/.coreosrc && ln -s $SCRIPT_DIR/.coreosrc $HOME/.coreosrc && chmod 700 $HOME/.coreosrc
[[ -f $HOME/.gitconfig ]] && rm -f $HOME/.gitconfig && ln -s $SCRIPT_DIR/../git/.gitconfig $HOME/.gitconfig && chmod 700 $HOME/.gitconfig
[[ -f $HOME/.gorc ]] && rm -f $HOME/.gorc && ln -s $SCRIPT_DIR/.gorc $HOME/.gorc && chmod 700 $HOME/.gorc
