#!/usr/bin/env bash

touch "/run/media/${USER}/boot/ssh"
sudo umount "/run/media/${USER}/boot"
sudo umount "/run/media/${USER}/rootfs"
sudo sync
