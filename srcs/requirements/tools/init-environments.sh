#!/bin/bash

# Get information for DataBase
printf "DataBase name for wordpress : "
read MARIADB_WORDPRESS_DBNAME
printf "MariaDB username for wordpress account : "
read MARIADB_WORDPRESS_USERNAME
printf "MariaDB password for wordpress account : "
read MARIADB_WORDPRESS_PASSWORD

# Get information for WordPress
printf "WordPress Domain : "
read WORDPRESS_DOMAIN
printf "WordPress Title : "
read WORDPRESS_TITLE

# Get information for Admin account
printf "Admin name for WordPress : "
read WORDPRESS_ADMIN_USERNAME
printf "Admin password for WordPress : "
read WORDPRESS_ADMIN_PASSWORD
printf "Admin email for WordPress : "
read WORDPRESS_ADMIN_EMAIL

# Get information for User account
printf "User name for WordPress : "
read WORDPRESS_USER_USERNAME
printf "User password for WordPress : "
read WORDPRESS_USER_PASSWORD
printf "User email for WordPress : "
read WORDPRESS_USER_EMAIL

# Create env file
cat > srcs/.env << EOF
# Environment file for docker-compose

# Config for DataBase
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
