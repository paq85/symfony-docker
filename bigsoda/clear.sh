#!/usr/bin/env bash

# WARNING!!!
# Clears all Docker's images and containers

# Delete all containers
docker rm -f $(docker ps -a -q)
# Delete all images
docker rmi -f $(docker images -q)