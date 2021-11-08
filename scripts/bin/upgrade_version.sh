#!/bin/bash

VERSION="${1}"

sudo dnf upgrade -y --refresh

sudo dnf install -y dnf-plugin-system-upgrade

sudo dnf system-upgrade download  --releasever="${VERSION}" --allowerasing

#sudo dnf system-upgrade reboot
