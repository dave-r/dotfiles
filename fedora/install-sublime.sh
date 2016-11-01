#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

if [[ ! -v username ]]; then
    # get the user name (not the root user running the script)
    username=""
    . $SCRIPT_DIR/getusername.sh
    getuser

    HOMEDIR="/home/$username"

    export username
    export HOMEDIR
fi

# install sublime 3

# create a temp dir for holding install files
mkdir $SCRIPT_DIR/subl-install
cd $SCRIPT_DIR/subl-install

# download the package
wget https://download.sublimetext.com/sublime_text_3_build_3114_x64.tar.bz2

# install it
tar -xvjf sublime_text_3_build_3114_x64.tar.bz2
cd sublime_text_3
mkdir -p /usr/local/sublime-text-3

mv -f ./* /usr/local/sublime-text-3/
ln -s /usr/local/sublime-text-3/sublime_text /usr/local/bin/subl
chmod +x /usr/local/bin/subl

# clean up
rm -rf $SCRIPT_DIR/subl-install

# create settings directories
[[ ! -d $HOMEDIR/.config/sublime-text-3/Installed\ Packages ]] && mkdir -p $HOMEDIR/.config/sublime-text-3/Installed\ Packages
[[ ! -d $HOMEDIR/.config/sublime-text-3/Packages/User ]] && mkdir -p $HOMEDIR/.config/sublime-text-3/Packages/User


if [[ -f $SCRIPT_DIR/../sublime/Preferences.sublime-settings ]]
    then
        # backup any existing settings
        [[ -f $HOMEDIR/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ]] && mv $HOMEDIR/.config/sublime-text-3/Packages/User/Preferences.sublime-settings $HOMEDIR/.config/sublime-text-3/Packages/User/.backup-Preferences.sublime-settings-backup

        # add settings
        # for some reason sublime doesn't seem to like when the setings file is a link, so we are copying the file
        # instead of linking (ln -s ....).  Maybe one day I'll figure out what i'm doing wrong and get the link working.
        cp $SCRIPT_DIR/../sublime/Preferences.sublime-settings $HOMEDIR/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

        # set up privs and owner
        chown $username:$username $HOMEDIR/.config/sublime-text-3/Packages/User/Preferences.sublime-settings 
fi

# Install package control
curl -o $HOMEDIR/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package
