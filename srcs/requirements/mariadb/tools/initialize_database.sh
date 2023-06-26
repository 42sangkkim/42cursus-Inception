#!/bin/sh

# Waiting for Daemon ready
mariadb-show -u root
while [ $? -ne 0 ] ; do
	sleep 0.5
	mariadb-show -u root
done

mariadb -u root << EOF
-- Delete anonymous accounts
DELETE from mysql.db where User='';
-- Set password for root account
ALTER USER 'root'@'localhost' identified by '${ROOT_PASSWORD}';
FLUSH PRIVILEGES;

-- Create DATABASE and USER for WordPress
CREATE DATABASE if not exists 
	${WORDPRESS_DBNAME};
CREATE USER if not exists 
	'${WORDPRESS_USERNAME}'@'%' 
	identified by '${WORDPRESS_PASSWORD}';
GRANT all privileges on ${WORDPRESS_DBNAME}.* to '${WORDPRESS_USERNAME}'@'%';
FLUSH PRIVILEGES;
EOF
