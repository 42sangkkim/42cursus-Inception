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
COPY ["tools/init.sh", "."]
RUN ["chmod", "+x", "./init.sh"]

# Health check for HTTPS port
HEALTHCHECK --interval=10s --timeout=10s --start-period=500ms --retries=3 \
  CMD netstat -tnlp | grep :443

ENTRYPOINT ["dumb-init", "/root/init.sh"]
