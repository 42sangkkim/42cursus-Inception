#!/bin/bash

# Get information for DataBase
printf "Basic etting for MariaDB"
printf "Root password : "
read MARIADB_ROOT_PASSWORD

printf "\nCreate MariaDB database and user for WordPRess"
printf "DATABASE name : "
read MARIADB_WORDPRESS_DBNAME
printf "User name : "
read MARIADB_WORDPRESS_USERNAME
printf "User password : "
read MARIADB_WORDPRESS_PASSWORD

# Get information for WordPress
printf "\n\nBasic setting for WordPress web site"
printf "Domain : "
read WORDPRESS_DOMAIN
printf "Title : "
read WORDPRESS_TITLE

# Get information for Admin account
printf "\nCreate Admin account for WordPress"
printf "Admin Username : "
read WORDPRESS_ADMIN_USERNAME
printf "Admin Password : "
read WORDPRESS_ADMIN_PASSWORD
printf "Admin Email : "
read WORDPRESS_ADMIN_EMAIL

# Get information for User account
printf "\nCreate auser for WordPress"
printf "User Username : "
read WORDPRESS_USER_USERNAME
printf "User Password : "
read WORDPRESS_USER_PASSWORD
printf "User Email : "
read WORDPRESS_USER_EMAIL

# Create env file
cat > srcs/.env << EOF
# Environment file for docker-compose

# Config for DataBase
MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD}
MARIADB_WORDPRESS_DBNAME=${MARIADB_WORDPRESS_DBNAME}
MARIADB_WORDPRESS_USERNAME=${MARIADB_WORDPRESS_USERNAME}
MARIADB_WORDPRESS_PASSWORD=${MARIADB_WORDPRESS_PASSWORD}

# Config for WordPress
WORDPRESS_DOMAIN=${WORDPRESS_DOMAIN}
WORDPRESS_TITLE=${WORDPRESS_TITLE}

# WordPress Admin
WORDPRESS_ADMIN_USERNAME=${WORDPRESS_ADMIN_USERNAME}
WORDPRESS_ADMIN_PASSWORD=${WORDPRESS_ADMIN_PASSWORD}
WORDPRESS_ADMIN_EMAIL=${WORDPRESS_ADMIN_EMAIL}

# WordPress User
WORDPRESS_USER_USERNAME=${WORDPRESS_USER_USERNAME}
WORDPRESS_USER_PASSWORD=${WORDPRESS_USER_PASSWORD}
WORDPRESS_USER_EMAIL=${WORDPRESS_USER_EMAIL}
EOF

echo "Config is done! Try make to build your docker project."
