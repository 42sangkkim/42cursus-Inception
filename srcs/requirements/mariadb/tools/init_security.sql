
-- Delete anonumous accounts
DELETE FROM mysql.user WHERE User="";

-- Set password to root account
SET PASSWORD FOR "root"@"localhost" = PASSWORD("${ROOT_PASSWORD}");

-- Apply
FLUSH PRIVILEGES;
