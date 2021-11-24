#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

cd $HOME

# 1st, backup existing dotfiles
#tar -cf $HOME/dotfiles-backup.tar $HOME/.bashrc $HOME/.bash_profile $HOME/.dockerrc $HOME/.gitconfig

# remove existing dotfiles, link new dotfiles from this repo and set permissions 
echo "Setting up dot files"
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
else
	echo 'Found Ruby'
fi

# install homebrew
if [[ -z $(which brew) ]]
then
	echo 'Installing HomeBrew'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo 'Found HomeBrew'
fi

# install fonts
echo 'Installing fonts'
cp -R -f $SCRIPT_DIR/../fonts/Hack $HOME/Library/Fonts/

# install iterm
echo 'Installing iterm'
brew cask install iterm2
cp $SCRIPT_DIR/iterm/com.googlecode.iterm2.plist $HOME/Library/Preferences

# install powerline
echo 'Installing powerline'
pip install --user powerline-status

# install alfred
echo 'Installing alfred'
brew cask install alfred

# install sublime text
echo 'Installing Sublime'
$SCRIPT_DIR/sublime/install.sh

# install go
echo 'Installing go'
brew install go
mkdir -p $HOME/dev/go/bin
mkdir -p $HOME/dev/go/src

# install java
echo 'Installing java'
brew cask install java

# install gradle
echo 'Installing gradle'
brew install gradle

# install docker
echo 'Installing docker'
brew cask install docker

# install idea
echo 'Installing Intellij Idea'
brew cask install intellij-idea

# install webstorm
echo 'Installing WebStorm'
brew cask install webstorm


