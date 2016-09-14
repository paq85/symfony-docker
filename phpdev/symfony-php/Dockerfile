FROM debian:stretch

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

# git is required by Composer
RUN apt-get update && apt-get install -y apt-utils curl wget bzip2 git make php7.0-common php7.0-cli php7.0-fpm php7.0-mcrypt php7.0-mysql php7.0-sqlite php7.0-pgsql php7.0-mongo php7.0-redis php7.0-apcu php7.0-memcached php7.0-gd php7.0-imagick php7.0-curl php7.0-intl php7.0-xsl php7.0-gmp php7.0-xdebug
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN wget http://www.phing.info/get/phing-latest.phar && chmod +x phing-latest.phar && mv phing-latest.phar /usr/local/bin/phing
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && chmod a+x /usr/local/bin/symfony

ADD start.sh /start.sh

RUN \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    /bin/echo -e "\nAllowUsers phpdev" >> /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# SSH for PHPStorm fix http://stackoverflow.com/questions/28612875/phpstorm-algorithm-negotiation-fail
RUN /bin/echo -e "\nKexAlgorithms curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1" >> /etc/ssh/sshd_config

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

VOLUME /var/www/symfony

EXPOSE 22
EXPOSE 9000

RUN \
    useradd -u 1000 --home /var/www/symfony --shell /bin/bash --no-user-group phpdev && \
    groupadd docker && \
    usermod -a -G docker phpdev && \
    /bin/echo -e "phpdev\nphpdev" | passwd phpdev

# Fix for "ERROR: unable to bind listening socket for address '/run/php/php7.0-fpm.sock': No such file or directory "
RUN service php7.0-fpm start

CMD ["/bin/bash", "/start.sh"]
