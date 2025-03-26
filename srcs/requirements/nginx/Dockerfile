# syntax=docker/dockerfile:1
ARG		CODE_VERSION=bullseye
FROM		debian:${CODE_VERSION}

WORKDIR		/etc/ssl/private/

RUN		apt-get update -y && apt-get install -y nginx openssl \
		&& openssl req -x509 -newkey rsa:2048 -nodes \
		-keyout key.pem \
		-out cert.pem \
		-days 365 \
		-subj "/C=DE/ST=Baden-Wuerttemberg/L=Heilbronn/O=42/OU=Student/CN=sganiev.42.fr/emailAddress=sam.edu.post42@gmail.com" \
		&& rm -rf /var/lib/apt/lists/*

WORKDIR		/etc/nginx/

COPY            nginx_wordpress.conf conf.d/

ENTRYPOINT	["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE		443/tcp

# docker build -t nginx:latest .
# docker run --network=inception \
#  --name=nginx \
#  --mount type=volume,src=wordpress-vol,dst=/wordpress,ro \
#  -d -p 443:443 nginx:latest

#openssl verify -CAfile cert.pem cert.pem -> verify that the certificate is signed
