#!/bin/bash
podman rm funbox
podman run --name funbox --rm -it wernight/funbox
#podman run --name funbox --rm -it judavi/funbox
