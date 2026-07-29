#!/usr/bin/env bash

#sudo sshfs -o allow_other,default_permissions,IdentityFile=/home/joe/.ssh/id_ed25519 joe@worktop:/var/home/joe /mnt/worktop/home
sudo sshfs -o allow_other,default_permissions,IdentityFile=/home/joe/.ssh/id_ed25519 joe@worktop:/var/home/joe /mnt/worktop/home
