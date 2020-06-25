#!/bin/bash


if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root"
  exit
fi

dnf remove $(dnf repoquery --installonly --latest-limit=-2 -q)

#Update and clean up dnf
#dnf clean all
dnf upgrade --best --allowerasing -y;

dnf distro-sync --best --allowerasing -y;
#dnf clean all;

# Update and Clean up Flatpak
#sudo su -c "flatpak update -y" jharry;

rm -rf /var/tmp/flatpak-cache-*

flatpak update -y --user
flatpak update -y
flatpak uninstall --unused -y

sudo -u joe flatpak uninstall --unused -y --user
