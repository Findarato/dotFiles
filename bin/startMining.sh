docker rm cuda_miner

nvidia-docker run --name cuda_miner -it findarato/docker-ethminer \
-S eth-us-east1.nanopool.org:9999 \
-O 0xf5ceb3d2e78ee027d93aa18f9129c7988d54a159.it01/Findarato@gmail.com
