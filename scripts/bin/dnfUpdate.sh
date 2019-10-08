#!/bin/bash


if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root"
  exit
fi

#Update and clean up dnf
#dnf clean all
dnf upgrade --best --allowerasing -y;

dnf distro-sync --best --allowerasing -y;
#dnf clean all;

# Update and Clean up Flatpak
#sudo su -c "flatpak update -y" jharry;

flatpak update -y
flatpak uninstall --unused -y
