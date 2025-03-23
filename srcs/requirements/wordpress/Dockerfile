# syntax=docker/dockerfile:1
ARG     CODE_VERSION=bullseye
FROM	debian:${CODE_VERSION}

WORKDIR	/

RUN     apt-get update -y && apt-get install -y wget unzip \
	&& wget -c -N -O wordpress.zip https://wordpress.org/latest.zip \
	&& unzip wordpress.zip \
	&& rm wordpress.zip \
	&& apt-get purge --auto-remove -y wget unzip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# test
ENTRYPOINT ["/bin/bash"]

# docker build -t wordpress:latest .
# docker run --network=inception \
# --name=wordpress \
# --mount type=volume,src=wordpress-vol,dst=/wordpress \
# -it --rm wordpress:latest

# - multiple containers can mount a file or directory containing
#   the shared information, using a Docker volume;
# - compose file can define the shared variables
