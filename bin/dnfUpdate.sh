#!/bin/bash


if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root"
  exit
fi

dnf clean all
dnf upgrade --best --allowerasing -y;
dnf upgrade --refresh -y;
dnf distro-sync --best --allowerasing -y;
dnf clean all;
flatpak update -y;
