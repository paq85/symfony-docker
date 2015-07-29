#!/bin/bash

set -e

if [ -z "$USER_NAME" ]; then
	echo "USER_NAME not provided"
	exit 1
fi
if [ -z "$USER_PASSWORD" ]; then
	echo "USER_PASSWORD not provided"
	exit 2
fi

mkdir -p /var/www/symfony

if getent passwd $USER_NAME > /dev/null 2>&1; then
    echo "User $USER_NAME already exists. Just updating password."
else
    echo "Creating user: $USER_NAME"
    useradd -u 1000 --home /var/www/symfony --shell /bin/bash --no-user-group $USER_NAME
    groupadd docker
    usermod -a -G docker $USER_NAME
fi

/bin/echo -e "$USER_PASSWORD\n$USER_PASSWORD" | passwd $USER_NAME
