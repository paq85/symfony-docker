FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

RUN apt-get update && apt-get install -y nginx

RUN \
    rm /etc/nginx/sites-enabled/default && \
    echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf && \
    usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
