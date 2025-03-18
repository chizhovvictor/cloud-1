#!/bin/bash

openrc
touch /run/openrc/softlevel

# create user
if [ -n "$SSH_USER" ] && [ -n "$SSH_PASSWORD" ]; then
	adduser -s /bin/bash $SSH_USER
	addgroup $SSH_USER wheel
	sed -i -e "s/^#.%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/" /etc/sudoers
	echo "$SSH_USER:$SSH_PASSWORD" | chpasswd
	ssh-keygen -A
fi
/usr/sbin/sshd -D