#!/bin/bash


if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root"
  exit
fi

#dnf remove $(dnf repoquery --installonly --latest-limit=-2 -q)

#Update and clean up dnf
#dnf clean all
#dnf offline-upgrade de --refresh --skip-broken --best --allowerasing -y;

#dnf distro-sync --skip-broken --best --allowerasing -y;

dnf offline-upgrade download


sudo dnf autoremove
#dnf clean all;

# Update and Clean up Flatpak
#sudo su -c "flatpak update -y" jharry;


sudo fwupdmgr get-devices

sudo fwupdmgr refresh --force

sudo fwupdmgr get-updates
sudo fwupdmgr update

rm -rf /var/tmp/flatpak-cache-*

flatpak update -y
flatpak uninstall --unused -y


echo "${BASEUSER}"


echo "Checking if restart is needed"
dnf needs-restarting -r

exit


echo "Reverting to Base User"
flatpak update -y --user
flatpak uninstall --unused -y --user

#if [$1 -eq "reboot" ]; then
if [ $(dnf needs-restarting -r) ]; then
  echo "NEEDS Rebooting?"
  dnf offline-upgrade reboot

#  sudo systemctl start reboot.target
else
  echo "DOES NOT NEED Rebooting?"

fi