sudo dnf upgrade -y --refresh

sudo dnf install -y dnf-plugin-system-upgrade

sudo dnf system-upgrade download -y --releasever=28 --allowerasing

#sudo dnf system-upgrade reboot
