#!/bin/bash

# install basic setup
# mostly taken from 
#  https://github.com/jfrazelle/dotfiles/blob/f82e180368c1f3f4bb32297fb023c0ad2d0563e6/bin/install.sh
#

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# get the user name (not the root user running the script)
# TODO : makes a bad assumption that there is only 1 user
USERNAME=$(find /home/* -maxdepth 0 -printf "%f" -type d)

# remove existing dotfiles
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.backup-bashrc-backup
[[ -f ~/.bash_aliases ]] && mv ~/.bash_aliases ~/.backup-bash_aliases-backup

# link dotfiles
ln -s $SCRIPT_DIR/.bashrc ~/.bashrc
ln -s $SCRIPT_DIR/.bash_aliases ~/.bash_aliases

# set permissions
chmod 700 ~/.bashrc
chmod 700 ~/.bash_aliases

# TODO : Set up .Xmodmap

# set up sudo for a user
# 	"because fuck typing that shit all the time"
# 		- jfrazelle
setup_sudo() {
	# add user to sudoers
	adduser "$USERNAME" sudo

	# add user to systemd groups
	# then you wont need sudo to view logs and shit
	gpasswd -a "$USERNAME" systemd-journal
	gpasswd -a "$USERNAME" systemd-network

	# add go path to secure path
	{ \
		echo -e 'Defaults	secure_path="/usr/local/go/bin:/home/$USERNAME/.go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'; \
		echo -e 'Defaults	env_keep += "ftp_proxy http_proxy https_proxy no_proxy GOPATH EDITOR"'; \
		echo -e "${USERNAME} ALL=(ALL) NOPASSWD:ALL"; \
		echo -e "${USERNAME} ALL=NOPASSWD: /bin/mount, /sbin/mount.nfs, /bin/umount, /sbin/umount.nfs, /sbin/ifconfig, /sbin/ifup, /sbin/ifdown, /sbin/ifquery"; \
	} >> /etc/sudoers
}
