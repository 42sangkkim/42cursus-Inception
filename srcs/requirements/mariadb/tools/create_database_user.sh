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
  ${WORDPRESS_DBNAME};
CREATE USER if not exists
  '${WORDPRESS_USERNAME}'@'%'
  identified by '${WORDPRESS_PASSWORD}';
GRANT all privileges
  on ${WORDPRESS_DBNAME}.*
  to '${WORDPRESS_USERNAME}'@'%';
FLUSH PRIVILEGES;
EOF
