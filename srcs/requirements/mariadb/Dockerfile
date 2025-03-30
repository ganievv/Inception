# syntax=docker/dockerfile:1
ARG	    CODE_VERSION=bullseye
FROM        debian:${CODE_VERSION}

ADD         init.sh /

# procps - test for using 'ps' command
RUN         apt-get update -y && apt-get install -y mariadb-server mariadb-client procps \
	    && chmod u+x /init.sh

ENTRYPOINT  ["/init.sh"]

# docker build -t mariadb:local .

# docker run -d --network=inception --name=mariadb mariadb:local
