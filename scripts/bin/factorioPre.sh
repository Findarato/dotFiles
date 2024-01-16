#!/usr/bin/env bash


cd ${HOME}/Downloads/2024/factorio/

./FAE_Linux /mnt/storage/SteamLibrary/steamapps/common/Factorio/bin/x64/factorio

./node_exporter-1.7.0.linux-amd64/node_exporter --collector.disable-defaults --collector.textfile --collector.textfile.directory=/home/joe/.var/app/com.valvesoftware.Steam/.factorio/script-output/graftorio2