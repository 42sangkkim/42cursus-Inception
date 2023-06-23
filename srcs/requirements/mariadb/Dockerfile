# Base image: apline 3.17 (penultimate version)
FROM alpine:3.17

# Update packages
RUN ["apk", "update"]
# Install packages
RUN ["apk", "add", "mariadb", "mariadb-client", "dumb-init"]

# Change working directory : /root/
WORKDIR /root
# Modify configuration file
RUN ["sed", "-i", "s/skip-networking//g", "/etc/my.cnf.d/mariadb-server.cnf"]
# Copy init script
COPY ["tools/create_database_user.sh", "."]
CMD ["chmod", "500", "create_database_user.sh"]
COPY ["tools/init.sh", "."]
CMD ["chmod", "500", "init.sh"]

# Add health check for wordpress db
HEALTHCHECK --interval=10s --timeout=10s --start-period=500ms --retries=3 \
  CMD mariadb-show --host=mariadb \
        --user=$WORDPRESS_USERNAME \
        --password=$WORDPRESS_PASSWORD \
        $WORDPRESS_DBNAME

EXPOSE 3306
VOLUME /var/lib/mysql
ENTRYPOINT ["dumb-init", "/root/init.sh"]
