#!/bin/sh

# Waiting for DB ready
mariadb-show -u root
while [ $? -ne 0 ] ; do
	sleep 0.5
	mariadb-show -u root
done

