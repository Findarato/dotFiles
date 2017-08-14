#!/bin/bash
killall -9 firefox
killall -9 chrome
killall -9 vivaldi-bin
NOW=$(date +%A.%H)
#updateRepos.sh
gnome-shell --replace
