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
COPY --chmod=500 ["tools/create_database_user.sh", "."]
COPY --chmod=500 ["tools/init.sh", "."]

EXPOSE 3306
VOLUME /var/lib/mysql
CMD ["dumb-init", "/root/init.sh"]
