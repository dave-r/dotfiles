#!/bin/bash

# Directory where sublime settings are stored
SUBL_PACKAGES="~/Library/Application\ Support/Sublime\ Text\ 3/Packages"
SUBL_SETTINGS=$SUBL_PACKAGES/User

# remove settings file
rm -f "$SUBL_SETTINGS/Preferences.sublime-settings"

# create symlink to settings file
ln -s ./Preferences.sublime-settings "$SUBL_SETTINGS/Preferences.sublime-settings"

# symlink the color theme
ln -s ./Solarized-dark.tmTheme "$SUBL_PACKAGES/solarized.tmTheme"