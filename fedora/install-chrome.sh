#!/bin/bash

echo 'Installing Chrome'

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

[[ -f $SCRIPT_DIR/google-chrome.repo ]] && cp $SCRIPT_DIR/google-chrome.repo /etc/yum.repos.d/
dnf -y install google-chrome-stable
