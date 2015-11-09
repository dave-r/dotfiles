#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# create the fonts directory if it doesn't already exist
[[ ! -d ~/.fonts ]] && mkdir ~/.fonts

# copy the fonts
cp -rf $SCRIPT_DIR/../fonts/* ~/.fonts/
