#!/bin/bash


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

dnf update -y;
dnf upgrade --refresh;
dnf distro-sync -y;
flatpak update -y;
