FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

# TODO: install xdebug only if requested
# TODO: git required by composer so install only if requested
RUN apt-get update && apt-get install -y apt-utils curl mc htop php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-apcu php5-gd php5-imagick php5-curl php5-intl php5-xdebug git
RUN apt-get install -y npm && \
    npm install -g bower grunt-cli gulp && ln -s /usr/bin/nodejs /usr/bin/node
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

ADD start.sh /start.sh

RUN \
    apt-get update && apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    /bin/echo -e "\nAllowUsers bigsoda" >> /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

VOLUME /var/www/symfony

EXPOSE 22
EXPOSE 9000

RUN \
    useradd -u 1000 --home /var/www/symfony --shell /bin/bash --no-user-group bigsoda && \
    groupadd docker && \
    usermod -a -G docker bigsoda && \
    /bin/echo -e "bigsoda\nbigsoda" | passwd bigsoda

CMD ["/bin/bash", "/start.sh"]
