#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install oh-my-zsh customizations
mkdir -p $HOME/.oh-my-zsh
cp $SCRIPT_DIR/custom/*.zsh $HOME/.oh-my-zsh/custom/
