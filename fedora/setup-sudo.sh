#!/bin/bash

# get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

# get the user name (not the root user running the script)
username=""
. $SCRIPT_DIR/getusername.sh
getuser

HOMEDIR="/home/$username"

setup_sudo() {
	# add user to sudoers
	# adduser "$username" sudo

	# add user to systemd groups
	# then you wont need sudo to view logs and shit
	gpasswd -a "$username" systemd-journal
	gpasswd -a "$username" systemd-network

	# backup sudoers file
	cp /etc/sudoers /etc/.backup-sudoers-backup

	# add go path to secure path
	{ \
		echo -e 'Defaults	secure_path="/usr/local/go/bin:/home/$USERNAME/.go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'; \
		echo -e 'Defaults	env_keep += "ftp_proxy http_proxy https_proxy no_proxy GOPATH EDITOR"'; \
		echo -e "${username} ALL=(ALL) NOPASSWD:ALL"; \
		echo -e "${username} ALL=NOPASSWD: /bin/mount, /sbin/mount.nfs, /bin/umount, /sbin/umount.nfs, /sbin/ifconfig, /sbin/ifup, /sbin/ifdown, /sbin/ifquery"; \
	} >> /etc/sudoers
}

setup_sudo
