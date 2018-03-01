#!/bin/bash

STATUS=$(docker ps | grep cuda_miner)

if [[ $STATUS ]]; then
#The thing is running
	echo "Stopping container"
	docker stop cuda_miner
	docker rm cuda_miner
else
	docker stop cuda_miner
	docker rm cuda_miner
	echo "Restarting Gnome-shell"
	echo "Starting Container"
	nvidia-docker run \
	--name cuda_miner \
	-d \
	-it findarato/docker-ethminer \
	-F http://192.168.5.1:8080/it01

	docker logs cuda_miner -f --tail=30

fi
