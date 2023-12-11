#!/bin/bash

sudo dnf distro-sync -y

sudo dnf -y reinstall xorg-x11-drv-nvidia xorg-x11-drv-nvidia-cuda

sudo dnf -y reinstall kernel\*