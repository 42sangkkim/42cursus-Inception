#!/bin/sh

chown -R mysql:mysql /var/lib/mysql

mariadb-install-db --user=mysql

mariadbd-safe --user=mysql \
	--basedir=/var/lib/mysql \
	--datadir=/var/lib/mysql/data &\
mysql -u root << EOF
CREATE database if not exists ${MARIADB_DBNAME};
CREATE user if not exists ${MARIADB_USERNAME}@'%' identified by '${MARIADB_PASSWORD}';
GRANT all privileges on ${MARIADB_DBNAME} to ${MARIADB_USERNAME}@'%';
FLUSH privileges;
EOF
