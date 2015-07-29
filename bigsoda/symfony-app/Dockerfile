FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

ENV USER_NAME=bigsoda USER_PASS=bigsoda

VOLUME /var/www/symfony

RUN \
    mkdir -p /var/www/symfony && \
    useradd -u 1000 --home /var/www/symfony --shell /bin/bash --no-user-group bigsoda && \
    groupadd docker && \
    usermod -a -G docker bigsoda && \
    /bin/echo -e "bigsoda\nbigsoda" | passwd bigsoda