#!/usr/bin/env bash

sudo -u gdm dbus-run-session gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0

sudo systemctl restart gdm