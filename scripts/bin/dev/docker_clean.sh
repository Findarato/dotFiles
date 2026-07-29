#!/usr/bin/env bash

if hash podman 2> /dev/null; then
  echo "Cleaning up podman containers and images..."
  # Delete all containers
  podman rm $(podman ps -a -q)
  # Delete all images
  podman rmi $(podman images -q)
fi

if hash docker 2> /dev/null; then
  echo "Cleaning up docker containers and images..."
  # Delete all containers
  docker rm $(docker ps -a -q)
  # Delete all images
  docker rmi $(docker images -q)
fi
