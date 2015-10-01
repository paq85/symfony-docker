FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

ENV USER_NAME=phpdev USER_PASS=phpdev

VOLUME /var/www/symfony

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    mkdir -p /var/www/symfony && \
    useradd -u 1000 --home /var/www/symfony --shell /bin/bash --no-user-group phpdev && \
    groupadd docker && \
    usermod -a -G docker phpdev && \
    /bin/echo -e "phpdev\nphpdev" | passwd phpdev