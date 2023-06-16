#!/bin/sh

cd /root
chown -R mysql:mysql /var/lib/mysql
./create_database_user.sh &

cd /var/lib/mysql
mariadb-install-db --user=mysql
	--datadir=./data

mariadbd-safe --user=mysql \
	--basedir=/var/lib/mysql \
	--datadir=/var/lib/mysql/data
