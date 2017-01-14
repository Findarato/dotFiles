#!/bin/bash
killall -9 firefox
killall -9 chrome
killall -9 vivaldi-bin
NOW=$(date +%A.%H)
#updateRepos.sh
gnome-shell --replace

#lets run bleachbit with the presets that are setup in the GUI
#if they are not setup in the GUI this will fail
#please set them up in the GUI first

#bleachbit --preset -c

