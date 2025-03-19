# syntax=docker/dockerfile:1
ARG		CODE_VERSION=bullseye
FROM		debian:${CODE_VERSION}

# rm -rf /var/lib/apt/lists/* - Remove cached package lists to reduce image size
RUN		apt-get update -y && apt-get install -y nginx \
		&& rm -rf /var/lib/apt/lists/*

# do I need sudo for this ? :
# touch /etc/nginx/conf.d/wordpress.conf
# maybe I can do this in script file and COPY it here and launch

ENTRYPOINT	["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE		443/tcp
# docker build -t nginx:latest .
# docker run -d -p 443:443 nginx:latest
