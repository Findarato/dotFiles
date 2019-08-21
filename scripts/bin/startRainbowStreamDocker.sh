#!/bin/bash

# docker rm rainbowstream

podman run --rm -it -v /etc/localtime:/etc/localtime -v "${HOME}/.rainbow_oauth":/root/.rainbow_oauth  -v "${HOME}/.rainbow_config.json":/root/.rainbow_config.json --name rainbowstream jess/rainbowstream
#docker run --rm -it -v /etc/localtime:/etc/localtime -v $HOME/.rainbow_oauth:/root/.rainbow_oauth -v $HOME/.rainbow_config.json:/root/.rainbow_config.json --name rainbowstream jess/rainbowstream
