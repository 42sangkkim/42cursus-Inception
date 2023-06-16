#!/bin/sh

# Download the latest version of WordPress
cd /var/www/wordpress
wp --allow-root core download

# Waiting until container can login to the DB
mariadb-show \
	--user=${MARIADB_USERNAME} \
	--password=${MARIADB_PASSWORD} \
	--host=mariadb
	
while [ $? -ne 0 ] ; do
	sleep 0.5
	mariadb-show \
		--user=${MARIADB_USERNAME} \
		--password=${MARIADB_PASSWORD} \
		--host=mariadb
done

# Create a new wp-config.php file
wp --allow-root config create \
	--dbname=${MARIADB_DBNAME} \
	--dbuser=${MARIADB_USERNAME} \
	--dbpass=${MARIADB_PASSWORD} \
	--dbhost=mariadb

# Create the database based on wp-config,php
wp --allow-root db create
# Install WordPress
wp --allow-root core install \
	--url=${WORDPRESS_URL} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${ADMIN_USERNAME} \
	--admin_password=${ADMIN_PASSWORD} \
	--admin_email=${ADMIN_EMAIL}

php-fpm81 -F
