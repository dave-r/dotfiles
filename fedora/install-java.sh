#!/bin/bash

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# get the user name (not the root user running the script)
username=""
. $SCRIPT_DIR/getusername.sh
getuser

HOMEDIR="/home/$username"

# install java
dnf -y install java-1.8.0-openjdk
dnf -y install java-1.8.0-openjdk-devel

# set java home
export JAVA_HOME=/etc/alternatives/java_sdk_1.8.0
