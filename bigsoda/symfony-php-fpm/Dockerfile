FROM debian:jessie

MAINTAINER Damian Sromek <damian.sromek@gmail.com>

# git is required by Composer and Gulp so install only if requested
# make required by some NPM packages
RUN apt-get update && apt-get install -y apt-utils curl wget bzip2 git make php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-sqlite php5-pgsql php5-mongo php5-redis php5-apcu php5-memcached php5-gd php5-imagick php5-curl php5-intl php5-xsl php5-gmp php5-xdebug
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs && \
    npm install -g bower grunt-cli gulp
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN wget http://www.phing.info/get/phing-latest.phar && chmod +x phing-latest.phar && mv phing-latest.phar /usr/local/bin/phing

ADD start.sh /start.sh

RUN \
    apt-get update && apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    /bin/echo -e "\nAllowUsers bigsoda" >> /etc/ssh/sshd_config

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
    useradd -u 1000 --home /var/www/symfony --shell /bin/bash --no-user-group bigsoda && \
    groupadd docker && \
    usermod -a -G docker bigsoda && \
    /bin/echo -e "bigsoda\nbigsoda" | passwd bigsoda

CMD ["/bin/bash", "/start.sh"]
