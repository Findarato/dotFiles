#!/bin/bash

#sudo mount /run/media/${USER}/boot
#sudo mount /run/media/joe/rootfs
touch /run/media/${USER}/boot/ssh
sudo umount /run/media/${USER}/boot
sudo umount /run/media/${USER}/rootfs
sudo sync
