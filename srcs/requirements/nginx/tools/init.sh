#!/bin/sh

# Generate SSL certificate and key
openssl req -new -nodes -keyout sangkkim.42.fr.key \
	-x509 -days 365 -out sangkkim.42.fr.crt \
	-config openssl.conf

# Run nginx in foreground
nginx -g 'daemon off;'
