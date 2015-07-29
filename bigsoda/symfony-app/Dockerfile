FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

ENV USER_NAME=bigsoda USER_PASS=bigsoda

VOLUME /var/www/symfony

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]