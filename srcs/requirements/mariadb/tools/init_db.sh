#!/bin/sh

# Waiting for DB ready
mariadb-show -u root
while [ $? -ne 0 ] ; do
	sleep 0.5
	mariadb-show -u root
done

# Create DATABASE and USER
mysql -u root < ./init_wordpress.sql

# Setting for security
mysql -u root < ./init_security.sql
