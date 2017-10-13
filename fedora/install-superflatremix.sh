#!/bin/bash

echo 'Installing superflatremix'

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

echo 'Downloading superflatremix'
wget https://github.com/daniruiz/Super-Flat-Remix/archive/master.zip

echo 'Unzipping'
unzip ./master.zip

echo 'copying icons'
[[ ! -d $HOMEDIR/.icons ]] && mkdir $HOMEDIR/.icons

cp -r ./Super-Flat-Remix-master/Super\ Flat\ Remix $HOMEDIR/.icons

echo 'cleaning up superflatremix'
rm master.zip
rm -rf ./Super-Flat-Remix-master
