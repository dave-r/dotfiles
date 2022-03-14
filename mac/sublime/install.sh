#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install sublime
brew install --cask sublime-text

# Directory where sublime settings are stored
SUBL_PACKAGES="$HOME/Library/Application Support/Sublime Text 3/Packages"
SUBL_SETTINGS="$SUBL_PACKAGES/User"

mkdir -p "$SUBL_PACKAGES"
mkdir -p "$SUBL_SETTINGS"

# remove settings file
rm -f "$SUBL_SETTINGS/Preferences.sublime-settings"

# copy preferred settings in to place
cp $SCRIPT_DIR/Preferences.sublime-settings "$SUBL_SETTINGS/"

# put our custom keybinding(s) in place
cp "$SCRIPT_DIR/Default (OSX).sublime-keymap" "$SUBL_SETTINGS/"

# gotta have our color theme
cp $SCRIPT_DIR/Solarized-dark.tmTheme "$SUBL_PACKAGES/"
