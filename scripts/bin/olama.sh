#!/usr/bin/env bash
#
#        ,--.
#       /_ | |
#        ||| |
#  __   | || |
# /_ |__||_|| |
#    |___|__|
#
#  ollama run llama2-70b-chat:70b

docker stop ollama
docker rm ollama

docker run -d --device /dev/kfd \
--device /dev/dri \
-v ollama:/root/.ollama \
-p 11434:11434 --name ollama ollama/ollama:rocm

#docker exec -it ollama ollama run llama3


docker exec -it ollama ollama pull llama3.1:8b

docker exec -it ollama ollama pull qwen2.5-coder:1.5b-base

docker exec -it ollama ollama pull nomic-embed-text:latest

docker logs -f ollama && docker stop ollama && docker rm ollama