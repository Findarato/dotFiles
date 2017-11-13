docker stop cuda_miner
docker rm cuda_miner

#docker run --name docker_miner_monero -itd \
#-e username=48tXt7CbtuwaCQnjY5LRx3VCAxbce96rd7TdAhQzWR8ZTY3vEvUuxXpUjSh1qSBhjMAb52hMumPBpHyDqrtc4tjdCqwmy9U \
#-e email=example@example.com servethehome/monero_dwarfpool:nvidia


#nvidia-docker run \
#--name cuda_miner \
#-d \
#--restart=always \
#-it servethehome/ethereum:cuda \
#-S eth-us-east1.nanopool.org:9999 \
#-O 0xf5ceb3d2e78ee027d93aa18f9129c7988d54a159.\
#it01/\
#Findarato@gmail.com

#docker logs cuda_miner -f

nvidia-docker run \
--name cuda_miner \
-d \
-it findarato/docker-ethminer \
-F http://192.168.5.1:8080/it01
#-O 0xf5ceb3d2e78ee027d93aa18f9129c7988d54a159.\
#-S eth-us-east1.nanopool.org:9999 \
#-FS eth-us-west1.nanopool.org:9999 \
#Findarato@gmail.com

