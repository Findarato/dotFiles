#!/bin/bash


if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root"
  exit
fi

dnf remove $(dnf repoquery --installonly --latest-limit=-2 -q)

#Update and clean up dnf
dnf clean all
dnf upgrade --skip-broken --best --allowerasing -y;

dnf distro-sync --skip-broken --best --allowerasing -y;
#dnf clean all;

# Update and Clean up Flatpak
#sudo su -c "flatpak update -y" jharry;

rm -rf /var/tmp/flatpak-cache-*

flatpak update -y --user
flatpak update -y
flatpak uninstall --unused -y

BASEUSER=$(whoami | awk '{print $1}')

echo "${BASEUSER}"

sudo -u "${BASEUSER}" flatpak uninstall --unused -y --user

echo "Checking if restart is needed"
dnf needs-restarting -r

#if [$1 -eq "reboot" ]; then
#  sudo systemctl start reboot.target
#fi