#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

cd $HOME

# 1st, backup existing dotfiles
#tar -cf $HOME/dotfiles-backup.tar $HOME/.bashrc $HOME/.bash_profile $HOME/.dockerrc $HOME/.gitconfig

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
# cp -R -f $SCRIPT_DIR/../fonts/Hack $HOME/Library/Fonts/  # Hack doesn't seem to be available via homebrew
brew tap homebrew/cask-fonts
brew install --cask font-hack
brew install --cask font-fira-code
brew install --cask font-jetbrains-mono-nerd-font

# install iterm
echo 'Installing iterm'
brew cask install iterm2
cp $SCRIPT_DIR/iterm/com.googlecode.iterm2.plist $HOME/Library/Preferences

# install alfred
echo 'Installing alfred'
brew install --cask alfred

# install vs code
echo 'Installing VS Code'
brew install --cask visual-studio-code

# install sublime text
echo 'Installing Sublime'
$SCRIPT_DIR/sublime/install.sh

# install go
echo 'Installing go'
brew install go
mkdir -p $HOME/dev/go/bin
mkdir -p $HOME/dev/go/src

# install java
./java/install.sh

# install docker
echo 'Installing docker'
brew install --cask docker

# install jq
brew install jq

# install editor config file
cp $SCRIPT_DIR/.editorconfig $HOME
