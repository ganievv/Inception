# syntax=docker/dockerfile:1
ARG     CODE_VERSION=bullseye
FROM	debian:${CODE_VERSION}

WORKDIR	/

RUN     apt-get update -y && apt-get install -y wget unzip php7.4-fpm \
	&& wget -c -N -O wordpress.zip https://wordpress.org/latest.zip \
	&& unzip wordpress.zip \
	&& rm wordpress.zip \
	&& apt-get purge --auto-remove -y wget unzip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /run/php && chown -R www-data:www-data /run/php

COPY	fpm_wordpress.conf /etc/php/7.4/fpm/pool.d/
COPY	wp-config.php /wordpress/

ENTRYPOINT ["php-fpm7.4", "-F"]

# docker build -t wordpress:latest .
# docker run --network=inception \
# --name=wordpress \
# --mount type=volume,src=wordpress-vol,dst=/wordpress \
# -d wordpress:latest

# - multiple containers can mount a file or directory containing
#   the shared information, using a Docker volume;
# - compose file can define the shared variables
