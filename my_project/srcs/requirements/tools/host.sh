#!/bin/bash

declare file="/etc/hosts"
declare regex="\s+# DOCKER INCEPTION START\s+"
declare file_content=$( cat "${file}" )

if [ "$1" = 'add' ]; then
	if [[ " $file_content " =~ $regex ]]
		then
		    sudo sed -i '/# DOCKER INCEPTION START/,/# DOCKER INCEPTION END/d' /etc/hosts		    
	fi
	echo -e "# DOCKER INCEPTION START" | sudo tee -a /etc/hosts > /dev/null
	echo "$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' nginx)	tgildero.42.fr" | sudo tee -a /etc/hosts > /dev/null
	echo "$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mariadb)	mariadb.42.fr" | sudo tee -a /etc/hosts > /dev/null
 	echo "$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ftp)	ftp.42.fr" | sudo tee -a /etc/hosts > /dev/null
	echo "$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh)	ssh.42.fr" | sudo tee -a /etc/hosts > /dev/null
	echo -e "# DOCKER INCEPTION END" | sudo tee -a /etc/hosts > /dev/null
fi

if [ "$1" = 'delete' ]; then
	sudo sed -i '/# DOCKER INCEPTION START/,/# DOCKER INCEPTION END/d' /etc/hosts
fi

