
-- Create DataBase
CREATE DATABASE if not exists ${WORDPRESS_DBNAME};

-- Create User
CREATE USER if not exists "${WORDPRESS_USERNAME}"@"%" identified by "${WORDPRESS+PASSWORD}";

-- Grant Privileges
GRANT all privileges on ${WORDPRESS_DBNAME}.* to "${WORDPRESS_USERNAME}"@"%";

-- Apply
FLUSH PRIVILEGES;
