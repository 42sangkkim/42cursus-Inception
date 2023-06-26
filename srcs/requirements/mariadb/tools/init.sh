#!/bin/sh

chown -R mysql:mysql /var/lib/mysql

mariadb-install-db --user=mysql \
	--basedir=/usr \
	--datadir=/var/lib/mysql \
	--skip-test-db 

./initialize_database.sh &

mariadbd-safe --user=mysql \
	--basedir=/usr \
	--datadir=/var/lib/mysql \
	--port=3306
