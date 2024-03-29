#!/bin/bash

# set up docker environment
# the 'correct' way of doing this is to do 'eval $(docker-machine env)'
# however, if we haven't yet run the docker quickstart terminal then the docker host vm isn't running
# so the command can't find a docker daemon and fails.
# So instead we use 'hardcoded' values.  docker still won't work w/out running the quickstart terminal, but
# at least this way, once we run the quickstart terminal, docker should work in any terminal windows we happened to open before running the quickstart terminal.
# export DOCKER_HOST=tcp://192.168.99.100:2376
# export DOCKER_MACHINE_NAME=rancher-host
# export DOCKER_TLS_VERIFY=1
# export DOCKER_CERT_PATH=/Users/dave/.docker/machine/machines/default

# set some docker aliases
alias dbuild="docker build"
alias dstart="docker start"
alias dstop="docker stop"
alias drm="docker rm"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dlogs="docker logs"
alias dimages="docker images"
alias drmi="docker rmi"
alias ddangle="docker volume ls -f dangling=true"


# remove all unused images
function dcleanall {
	docker image prune --all
}

# get the ip address of a running container
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# enter a bash shell in a running container
function dbash {
	docker exec -it $1 /bin/bash
}
