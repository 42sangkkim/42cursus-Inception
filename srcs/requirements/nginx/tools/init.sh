#!/bin/sh

# Generate SSL certificate and key
openssl req -new -nodes -keyout sangkkim.42.fr.key \
	-x509 -days 365 -out sangkkim.42.fr.crt \
	-config openssl.conf

# Wait for nginx configuration is valid ( Wordpress is ready )
nginx -t
while [ $? -ne 0 ] ; do
	sleep 0.5
	nginx -t
done

# Run nginx in foreground
nginx -g 'daemon off;'
