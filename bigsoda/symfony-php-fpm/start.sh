#!/usr/bin/env bash

set -e

# Run SSH daemon
/usr/sbin/sshd
# Run PHP Service
php5-fpm -F