#!/bin/bash

openrc
touch /run/openrc/softlevel
/usr/bin/mysql_install_db --datadir=/var/lib/mysql
touch /root/init-sample
chmod 755 /root/init-sample

# clear test data mariadb
echo "DELETE FROM mysql.user WHERE user NOT IN ('mysql.sys', 'mariadb.sys', 'mysqlxsys', 'root') OR host NOT IN ('localhost');" >> /root/init-sample
echo "DELETE FROM mysql.db WHERE SUBSTR(Db, 1, 4) = 'test';" >> /root/init-sample
echo "DROP DATABASE test;" >> /root/init-sample
# create db
if [ -n "$MYSQL_DATABASE" ]; then
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> /root/init-sample
fi
# create user
if [ -n "$MYSQL_USER" ] && [ -n "$MYSQL_PASSWORD" ]; then
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; " >> /root/init-sample
	
	if [ -n "$MYSQL_DATABASE" ]; then
	    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> /root/init-sample
        echo "FLUSH PRIVILEGES;" >> /root/init-sample
	fi
fi
# change root password
if [ -n "$MYSQL_ROOT_PASSWORD" ]; then
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /root/init-sample
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION ;" >> /root/init-sample
    echo "FLUSH PRIVILEGES;" >> /root/init-sample
fi

perl -pe 's/\$([_A-Z]+)/$ENV{$1}/g' < /root/init-sample > /root/init
rm /root/init-sample
/usr/bin/mysqld --datadir='/var/lib/mysql' --init_file=/root/init
# bash