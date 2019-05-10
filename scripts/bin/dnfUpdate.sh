#!/bin/bash


if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root"
  exit
fi



#Update and clean up dnf
dnf clean all
dnf upgrade --best --allowerasing -y;
dnf upgrade --refresh -y;
dnf distro-sync --best --allowerasing -y;
dnf clean all;

# Update and Clean up Flatpak
flatpak update -y;
flatpak uninstall --unused -y
