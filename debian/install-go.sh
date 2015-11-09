#!/bin/bash

# install go
apt-get install golang

# create go dev dir
[[ ! -d $HOME/dev/go ]] && mkdir -p $HOME/dev/go

# set up go path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/dev/go

