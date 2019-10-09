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
[[ -f $HOME/.gorc ]] && rm -f $HOME/.gorc

# link dotfiles
[[ -f $SCRIPT_DIR/.bashrc ]] && ln -s $SCRIPT_DIR/.bashrc $HOME/.bashrc
[[ -f $SCRIPT_DIR/.bash_profile ]] && ln -s $SCRIPT_DIR/.bash_profile $HOME/.bash_profile
[[ -f $SCRIPT_DIR/.dockerrc ]] && ln -s $SCRIPT_DIR/.dockerrc $HOME/.dockerrc
[[ -f $SCRIPT_DIR/.coreosrc ]] && ln -s $SCRIPT_DIR/.coreosrc $HOME/.coreosrc
[[ -f $SCRIPT_DIR/../git/.gitconfig ]] && ln -s $SCRIPT_DIR/../git/.gitconfig $HOME/.gitconfig
[[ -f $SCRIPT_DIR/.gorc ]] && ln -s $SCRIPT_DIR/.gorc $HOME/.gorc

# set permissions
[[ -f $SCRIPT_DIR/.bashrc ]] && chmod 700 $HOME/.bashrc
[[ -f $SCRIPT_DIR/.bash_profile ]] && chmod 700 $HOME/.bash_profile
[[ -f $SCRIPT_DIR/.dockerrc ]] && chmod 700 $HOME/.dockerrc
[[ -f $SCRIPT_DIR/.coreosrc ]] && chmod 700 $HOME/.coreosrc
[[ -f $SCRIPT_DIR/../git/.gitconfig ]] && chmod 700 $HOME/.gitconfig
[[ -f $SCRIPT_DIR/.gorc ]] && chmod 700 $HOME/.gorc
