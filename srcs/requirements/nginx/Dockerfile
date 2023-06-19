# Base image: apline 3.17 (penultimate version)
FROM alpine:3.17

# Update packages
RUN ["apk", "update"]
# Install packages
RUN ["apk", "add", "nginx", "openssl", "dumb-init"]

# Change working directory : /root/
WORKDIR /root
# Remove example configuration
RUN ["rm", "-f", "/etc/nginx/http.d/default.conf"]
# Copy configuration files
COPY ["conf/www.wordpress.conf", "/etc/nginx/http.d"]
COPY ["conf/openssl.conf", "."]
# Copy init script
COPY --chmod=500 ["tools/init.sh", "."]

EXPOSE 443
VOLUME /var/www/wordpress
CMD ["dumb-init", "/root/init.sh"]
