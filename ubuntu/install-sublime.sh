#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install sublime 3

# download the .deb package
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb

# install it
sudo dpkg -i sublime-text_build-3083_amd64.deb

# clean up
rm sublime-text_build-3083_amd64.deb

# create settings directories
[[ ! -d $HOME/.config/sublime-text-3/Installed\ Packages ]] && mkdir -p $HOME/.config/sublime-text-3/Installed\ Packages
[[ ! -d $HOME/.config/sublime-text-3/Packages/User ]] && mkdir -p $HOME/.config/sublime-text-3/Packages/User


if [[ -f $SCRIPT_DIR/../sublime/Preferences.sublime-settings ]]
    then
        # backup any existing settings
        [[ -f $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ]] && mv $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings $HOME/.config/sublime-text-3/Packages/User/.backup-Preferences.sublime-settings-backup

        # add settings
        # for some reason sublime doesn't seem to like when the setings file is a link, so we are copying the file
        # instead of linking (ln -s ....).  Maybe one day I'll figure out what i'm doing wrong and get the link working.
        cp $SCRIPT_DIR/../sublime/Preferences.sublime-settings $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
fi

# Install package control
curl -o $HOME/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package
