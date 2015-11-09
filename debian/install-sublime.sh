#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install sublime 3

# download the .deb package
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb

# install it
sudo dpkg -i sublime-text_build-3083_amd64.deb

# clean up
rm sublime-text_build-3083_amd64.deb

# add settings
cp $SCRIPT_DIR/../sublime/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
