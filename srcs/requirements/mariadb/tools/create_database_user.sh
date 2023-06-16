#!/bin/sh

# Waiting for DB ready
mariadb-show -u root
while [ $? -ne 0 ] ; do
	sleep 0.5
	mariadb-show -u root
done

# Create DATABASE and USER
mysql -u root << EOF
CREATE DATABASE if not exists
  ${MARIADB_DBNAME};
CREATE USER if not exists
  '${MARIADB_USERNAME}'@'wordpress'
  identified by '${MARIADB_PASSWORD}';
GRANT all privileges
  on ${MARIADB_DBNAME}.*
  to '${MARIADB_USERNAME}'@'wordpress';
FLUSH PRIVILEGES;
EOF
