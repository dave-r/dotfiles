#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# install docker

# 1st set up the key
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# add the docker repo
echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list
apt-get update

# install
apt-get install docker-engine

# remove existing dotfiles
[[ -f ~/.dockerrc ]] && mv ~/.dockerrc ~/.backup-dockerrc-backup

# link dotfiles
ln -s $SCRIPT_DIR/../docker/.dockerrc ~/.dockerrc

# set permissions
chmod 700 ~/.dockerrc
