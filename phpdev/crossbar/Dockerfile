FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

# NOTE: Crossbar loads it's configuration from volume at /opt/crossbar_home

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-key adv --keyserver hkps.pool.sks-keyservers.net --recv D58C6920 && \
    /bin/sh -c "echo 'deb http://package.crossbar.io/ubuntu trusty main' > /etc/apt/sources.list.d/crossbar.list" && \
    apt-get update && apt-get install -y crossbar && \
    mkdir /opt/crossbar_home

ADD start.sh /start.sh

CMD ["/bin/bash", "/start.sh"]