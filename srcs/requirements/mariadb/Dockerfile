# syntax=docker/dockerfile:1
ARG	    CODE_VERSION=bullseye
FROM	debian:${CODE_VERSION}

ADD		init.sh /

# procps - test for using 'ps' command
RUN		apt-get update -y && apt-get install -y mariadb-server mariadb-client \
		&& chmod u+x /init.sh

RUN		sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

ENTRYPOINT	["/init.sh"]

# docker build -t mariadb:local .

# docker run -d --network=inception --name=mariadb mariadb:local
