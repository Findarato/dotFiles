#!/bin/bash

#
#This is from a page I found online
#
# https://major.io/2015/02/11/rotate-gnome-3s-wallpaper-systemd-user-units-timers/
#
 
walls_dir="${HOME}/Pictures"
selection=$(find "${walls_dir}" -type f -name "*.jpg" -o -name "*.png" | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$selection"
