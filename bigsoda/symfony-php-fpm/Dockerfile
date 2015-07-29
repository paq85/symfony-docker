FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

ENV USER_NAME=bigsoda USER_PASS=bigsoda

# TODO: install xdebug only if requested
# TODO: git required by composer so install only if requested
RUN apt-get update && apt-get install -y apt-utils curl mc htop php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-apcu php5-gd php5-imagick php5-curl php5-intl php5-xdebug git
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

ADD start.sh /start.sh

ADD 50-symfony.ini /etc/php5/fpm/conf.d/
ADD 50-symfony.ini /etc/php5/cli/conf.d/

ADD symfony.pool.conf /etc/php5/fpm/pool.d/

RUN \
    apt-get update && apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    /bin/echo -e "\nAllowUsers bigsoda" >> /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
# Enable Xdebug for CLI
RUN \
    /bin/echo -e "\nexport XDEBUG_CONFIG=\"idekey=PHPSTORM\"" >> /etc/profiles && \
    /bin/echo -e "\nexport PHP_IDE_CONFIG=\"serverName=symfony.local\"" >> /etc/profiles

VOLUME /var/www/symfony

EXPOSE 22
EXPOSE 9000

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash", "/start.sh"]
