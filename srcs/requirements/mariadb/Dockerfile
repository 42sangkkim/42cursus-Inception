# Base image: apline 3.17 (penultimate version)
FROM alpine:3.17

# Update packages
RUN ["apk", "update"]
# Install packages
RUN ["apk", "add", "mariadb", "mariadb-client"]

# Change working directory : /root/
WORKDIR /root
# Copy configuration file
# Copy init script
COPY --chmod=500 ["tools/init.sh", "."]

EXPOSE 3306
VOLUME /var/lib/mysql
CMD ["sh", "init.sh"]
