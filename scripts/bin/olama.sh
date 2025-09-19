docker stop ollama
docker rm ollama
docker run -d --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:rocm

docker exec -it ollama ollama run llama3