#!/usr/bin/env bash

VERSION="${1}"

sudo dnf clean all;

sudo dnf upgrade -y --refresh

sudo dnf install -y dnf-plugin-system-upgrade

sudo dnf clean all;

sudo dnf system-upgrade download  --releasever="${VERSION}" --allowerasing

echo "Now run: sudo dnf system-upgrade reboot"
