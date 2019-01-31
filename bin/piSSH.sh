#!/bin/bash

#sudo mount /run/media/joe/boot
#sudo mount /run/media/joe/rootfs
touch /run/media/joe/boot/ssh
sudo umount /run/media/joe/boot
sudo umount /run/media/joe/rootfs
sudo sync
