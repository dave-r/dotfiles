#!/bin/bash

echo 'Installing go'

# get the directory where the script is located
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

# install go
echo 'dnf installing golang'
dnf -y install golang

# create dev dir
echo 'creating go root dir'
[[ ! -d $HOMEDIR/dev/go ]] && mkdir -p $HOMEDIR/dev/go

# set up go path
echo "setting gopath to $HOMEDIR/dev/go"
export GOPATH=$HOMEDIR/dev/go
echo "set go path"

echo 'adding go to PATH'
[[ ":$PATH:" != *":$HOMEDIR/dev/go/bin:"* ]] && export PATH=$PATH:$HOMEDIR/dev/go/bin
