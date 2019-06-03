#!/bin/bash
clear

watch -c -t -n 1 "nvidia-smi | grep '%' | cut -c9-11 | figlet -f future"
