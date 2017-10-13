#!/bin/bash

echo 'Installing java'

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

# install java
echo 'dnf installing open jdk'
dnf -y install java-1.8.0-openjdk
dnf -y install java-1.8.0-openjdk-devel

# set java home
echo 'setting JAVA_HOME'
export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
