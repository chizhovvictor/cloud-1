#!/bin/bash

openrc
touch /run/openrc/softlevel

# create user
if [ -n "$FTP_USER" ] && [ -n "$FTP_PASSWORD" ]; then
	adduser --home=/var/www/html -D $FTP_USER
	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
	echo "$FTP_USER" >> /etc/vsftpd/vsftpd.userlist
fi
/usr/sbin/vsftpd /etc/vsftpd.conf
# bash