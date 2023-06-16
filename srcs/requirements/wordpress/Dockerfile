# Base image: apline 3.17 (penultimate version)
FROM alpine:3.17

# Add testing directory to list and update packages
RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN ["apk", "update"]
# Install packages
RUN ["apk", "add", \
  "php81-common"    , "php81-session"   , "php81-iconv"     , \
  "php81-json"      , "php81-gd"        , "php81-curl"      , \
  "php81-xml"       , "php81-mysqli"    , "php81-imap"      , \
  "php81-cgi"       , "fcgi"            , "php81-pdo"       , \
  "php81-pdo_mysql" , "php81-soap"      , "php81-posix"     , \
  "php81-gettext"   , "php81-ldap"      , "php81-ctype"     , \
  "php81-dom"       , "php81-simplexml" , "php81-fpm"       , \
  "php81-phar"      , "php81-pecl-xmlrpc", "php81-pecl-mcrypt", \
  "mariadb-client"]
ADD ["https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar", "/usr/local/bin/wp"]
RUN ["chmod", "+x", "/usr/local/bin/wp"]

# Change working directory : /root/
WORKDIR /root
# Set php-fpm network
RUN ["sed", "-i", "s/127.0.0.1:9000/wordpress:9000/g", "/etc/php81/php-fpm.d/www.conf"]
# Copy init script
COPY --chmod=500 ["tools/init.sh", "."]

EXPOSE 9000
VOLUME /var/www/wordpress
CMD ["sh", "init.sh"]
