# syntax=docker/dockerfile:1
ARG     CODE_VERSION=bullseye
FROM	debian:${CODE_VERSION}

WORKDIR	/

RUN		apt-get update -y && apt-get install -y procps wget unzip php7.4-fpm php7.4-mysql \
		php7.4-curl php7.4-gd php7.4-mbstring php7.4-xml php7.4-zip php7.4-bcmath \
		&& wget -c -N -O wordpress.zip https://wordpress.org/latest.zip \
		&& unzip wordpress.zip \
		&& rm wordpress.zip \
		&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp \
		&& apt-get purge --auto-remove -y wget unzip \
		&& apt-get clean \
		&& rm -rf /var/lib/apt/lists/* \
		&& mkdir -p /run/php && chown -R www-data:www-data /run/php

COPY	fpm_wordpress.conf /etc/php/7.4/fpm/pool.d/
COPY	wp-config.php /wordpress/

EXPOSE  9000

COPY	wp-install.sh /wp-install.sh
ENTRYPOINT	["/wp-install.sh"]

# docker build -t wordpress:latest .
# docker run --network=inception \
# --name=wordpress \
# --mount type=volume,src=wordpress-vol,dst=/wordpress \
# -d wordpress:latest

# - multiple containers can mount a file or directory containing
#   the shared information, using a Docker volume;
# - compose file can define the shared variables
