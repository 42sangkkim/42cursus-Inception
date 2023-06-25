#!/bin/sh

chown -R mysql:mysql /var/lib/mysql

mariadb-install-db --user=mysql \
	--basedir=/usr \
	--datadir=/var/lib/mysql \
	--skip-test-db 


echo "mariadb -u root << EOF\n" >> initialize_db.sh
cat  init_wordpress.sql         >> initialize_db.sh
echo "EOF"                      >> initialize_db.sh

echo "mariadb -u root << EOF\n" >> initialize_db.sh
cat  init_security.sql          >> initialize_db.sh
echo "EOF"                      >> initialize_db.sh

./initalize_db.sh

mariadbd-safe --user=mysql \
	--basedir=/usr \
	--datadir=/var/lib/mysql \
	--port=3306
