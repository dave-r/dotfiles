#!/bin/bash

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# get the user name (not the root user running the script)
username=""
. $SCRIPT_DIR/getusername.sh
getuser

HOMEDIR="/home/$username"

# install go
dnf -y install golang

# create dev dir
[[ ! -d $HOMEDIR/dev/go ]] && mkdir -p $HOMEDIR/dev/go

# set up go path
echo "setting gopath to $HOMEDIR/dev/go"
export GOPATH=$HOMEDIR/dev/go
echo "set go path"

[[ ":$PATH:" != *":$HOMEDIR/dev/go/bin:"* ]] && export PATH=$PATH:$HOMEDIR/dev/go/bin
