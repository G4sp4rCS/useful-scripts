#!/bin/bash
# Shell script for remove all docker containers, images and volumes
# Script by Grunt
##########################################
#   first stop all running containers
#   remove containers
#   remove images
#   remove volumes
##########################################
# stop all running containers
echo 'Stopping running containers'
docker stop $(docker ps -aq)

# remove all stopped containers
echo 'Removing containers ..'
docker rm $(docker ps -aq)

# remove all images
echo 'Removing images'
docker rmi --force $(docker images -q)

# remove all stray volumes if any
echo 'Removing docker container volumes'
docker volume rm $(docker volume ls -q)
