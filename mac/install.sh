#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

cd $HOME

# 1st, backup existing dotfiles
#tar -cf $HOME/dotfiles-backup.tar $HOME/.bashrc $HOME/.bash_profile $HOME/.dockerrc $HOME/.gitconfig

# remove existing dotfiles, link new dotfiles from this repo and set permissions 
[[ -f $HOME/.bashrc ]] && [[ -f $SCRIPT_DIR/.bashrc ]] && rm -f $HOME/.bashrc 
[[ -f $SCRIPT_DIR/.bashrc ]] && ln -s $SCRIPT_DIR/.bashrc $HOME/.bashrc && chmod 700 $HOME/.bashrc

[[ -f $HOME/.bash_profile ]] && [[ -f $SCRIPT_DIR/.bash_profile ]] && rm -f $HOME/.bash_profile 
[[ -f $SCRIPT_DIR/.bash_profile ]] && ln -s $SCRIPT_DIR/.bash_profile $HOME/.bash_profile && chmod 700 $HOME/.bash_profile

[[ -f $HOME/.dockerrc ]] && [[ -f $SCRIPT_DIR/.dockerrc ]] && rm -f $HOME/.dockerrc 
[[ -f $SCRIPT_DIR/.dockerrc ]] && ln -s $SCRIPT_DIR/.dockerrc $HOME/.dockerrc && chmod 700 $HOME/.dockerrc

[[ -f $HOME/.coreosrc ]] && rm -f $HOME/.coreosrc 
[[ -f $SCRIPT_DIR/.coreosrc ]] && [[ -f $SCRIPT_DIR/.coreosrc ]] && ln -s $SCRIPT_DIR/.coreosrc $HOME/.coreosrc && chmod 700 $HOME/.coreosrc

[[ -f $HOME/.gitconfig ]] && rm -f $HOME/.gitconfig 
[[ -f $SCRIPT_DIR/../git/.gitconfig ]] && [[ -f $SCRIPT_DIR/../git/.gitconfig ]] &&  ln -s $SCRIPT_DIR/../git/.gitconfig $HOME/.gitconfig && chmod 700 $HOME/.gitconfig

[[ -f $HOME/.gorc ]] && [[ -f $SCRIPT_DIR/.gorc ]] &&  rm -f $HOME/.gorc 
[[ -f $SCRIPT_DIR/.gorc ]] && ln -s $SCRIPT_DIR/.gorc $HOME/.gorc && chmod 700 $HOME/.gorc

# is ruby installed?
if [[ -z $(which ruby) ]] 
then
    echo 'Please install Ruby'
    exit 1
fi

# install homebrew
if [[ -z $(which brew) ]]
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install fonts
cp -R -f $SCRIPT_DIR/../fonts/Hack $HOME/Library/Fonts/

# install iterm
brew cask install iterm2
cp $SCRIPT_DIR/iterm/com.googlecode.iterm2.plist $HOME/Library/Preferences

# install powerline
pip install --user powerline-status

# install alfred
brew cask install alfred

