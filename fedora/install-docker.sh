#!/bin/bash

echo 'Installing Docker'

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

# make sure we have the needed dnf plugins
echo 'Installing dnf plugins'
dnf -y install dnf-plugins-core

# set up the stable repo
echo 'Adding dnf docker stable repo'
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# install docker
echo 'dnf installing Docker-ce'
dnf install docker-ce

# set systemctl to always run docker
echo 'enabling docker in systemd'
systemctl enable docker

# # run the docker install script
# curl -fsSL https://get.docker.com/ | sh

# add user to docker group
echo 'setting up current user for docker access'
groupadd docker
usermod -aG docker $username

# # enable docker service
# systemctl enable docker.service

# # start it up
# systemctl start docker

echo 'setting up .dockerrc'
if [[ -f $SCRIPT_DIR/../docker/.dockerrc ]]
	then
		# backup existing dockerrc
		[[ -f $HOMEDIR/.dockerrc ]] && mv $HOMEDIR/.dockerrc $HOMEDIR/.backup-dockerrc-backup

		# link dockerrc
		ln -s $SCRIPT_DIR/../docker/.dockerrc $HOMEDIR/.dockerrc
fi

# # install docker-compose
# curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose

# # install docker-machine
# curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine
# chmod +x /usr/local/bin/docker-machine
