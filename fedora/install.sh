#!/bin/bash

function install-all() {
    echo "installing apps..."

$SCRIPT_DIR/setup-sudo.sh
$SCRIPT_DIR/install-i3.sh
$SCRIPT_DIR/install-rxvt.sh
$SCRIPT_DIR/install-sublime.sh
$SCRIPT_DIR/install-docker.sh
$SCRIPT_DIR/install-chrome.sh
$SCRIPT_DIR/install-go.sh
$SCRIPT_DIR/install-java.sh
$SCRIPT_DIR/install-gradle.sh
$SCRIPT_DIR/install-plank.sh
$SCRIPT_DIR/install-arc.sh
$SCRIPT_DIR/install-superflatremix.sh
}

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# get the user name (not the root user running the script)
username=""
. $SCRIPT_DIR/getusername.sh
getuser

HOMEDIR="/home/$username"

export username
export HOMEDIR

# update packages
dnf -y update

# link bash dot files
if [[ -f $SCRIPT_DIR/.bashrc ]]
    then
        [[ -f $HOMEDIR/.bashrc ]] && mv $HOMEDIR/.bashrc $HOMEDIR/.backup-bashrc-backup
        ln -s $SCRIPT_DIR/.bashrc $HOMEDIR/.bashrc
        chmod 700 $HOMEDIR/.bashrc
fi

if [[ -f $SCRIPT_DIR/.bash_aliases ]]
    then
        [[ -f $HOMEDIR/.bash_aliases ]] && mv $HOMEDIR/.bash_aliases $HOMEDIR/.backup-bash_aliases-backup
        ln -s $SCRIPT_DIR/.bash_aliases $HOMEDIR/.bash_aliases  
        chmod 700 $HOMEDIR/.bash_aliases      
fi

if [[ -f $SCRIPT_DIR/.bash_utils ]]
    then
        [[ -f $HOMEDIR/.bash_utils ]] && mv $HOMEDIR/.bash_utils $HOMEDIR/.backup-bash_utils-backup
        ln -s $SCRIPT_DIR/.bash_utils $HOMEDIR/.bash_utils
        chmod 700 $HOMEDIR/.bash_utils
fi

# install fonts
if [[ -d $SCRIPT_DIR/../fonts ]]
    then
        [[ ! -d $HOMEDIR/.fonts ]] && mkdir $HOMEDIR/.fonts
        cp -r $SCRIPT_DIR/../fonts/* $HOMEDIR/.fonts/
fi

# set up dir colors
if [[ -f $SCRIPT_DIR/../.dircolors ]]
    then
        [[ -f $HOMEDIR/.dircolors ]] && mv $HOMEDIR/.dircolors $HOMEDIR/.backup-dircolors-backup
        cp $SCRIPT_DIR/../.dircolors $HOMEDIR/
fi

# set up editor config
if [[ -f $SCRIPT_DIR/../.editorconfig ]]
    then
    [[ -f $HOMEDIR/.editorconfig ]] && mv $HOMEDIR/.editorconfig $HOMEDIR/.backup-editorconfig-backup
    ln -s $SCRIPT_DIR/../.editorconfig $HOMEDIR/.editorconfig
fi

# link git config
if [[ -f $SCRIPT_DIR/../git/.gitconfig ]]
    then
        [[ -f $HOMEDIR/.gitconfig ]] && mv $HOMEDIR/.gitconfig $HOMEDIR/.backup-gitconfig-backup
        ln -s $SCRIPT_DIR/../git/.gitconfig $HOMEDIR/.gitconfig
fi

while getopts ":a" opt; do
    case $opt in
        a)
	  install-all
        ;;
    esac
done
