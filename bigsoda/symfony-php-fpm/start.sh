#!/usr/bin/env bash

set -e

chmod 777 -R /var/www/symfony/app/cache
chmod 777 -R /var/www/symfony/app/logs

# Run SSH daemon
/usr/sbin/sshd
# Run PHP Service
php5-fpm -F