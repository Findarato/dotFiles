#!/bin/bash



if hash podman 2>/dev/null; then
  # Delete all containers
#  podman rm $(podman ps -a -q)
  # Delete all images
#  podman rmi $(podman images -q)

elif hash docker 2>/dev/null; then
  # Delete all containers
  docker rm $(docker ps -a -q)
  # Delete all images
  docker rmi $(docker images -q)
fi
