FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

RUN apt-get update && apt-get install -y nginx

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    rm /etc/nginx/sites-enabled/default && \
    usermod -u 1000 www-data && \
    mkdir /etc/nginx/ssl

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
