#!/bin/bash



# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)

# Delete all containers
podman rm $(podman ps -a -q)
# Delete all images
podman rmi $(podman images -q)
