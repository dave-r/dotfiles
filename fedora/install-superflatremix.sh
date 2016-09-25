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

wget https://github.com/daniruiz/Super-Flat-Remix/archive/master.zip

unzip ./master.zip

[[ ! -d $HOMEDIR/.icons ]] && mkdir $HOMEDIR/.icons

cp -r ./Super-Flat-Remix-master/Super\ Flat\ Remix $HOMEDIR/.icons

rm master.zip
rm -rf ./Super-Flat-Remix-master