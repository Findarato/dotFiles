#!/bin/bash

# Kill all of the running files that need to be backed up
pkill --signal 9 firefox
pkill --signal 9 chrome
pkill --signal 9 chromium
pkill --signal 9 vivaldi
pkill --signal 9 evolution
pkill --signal 9 Enpass
#NOW=$(date +%A.%H)
#updateRepos.sh


${HOME}/bin/cleanCache.sh
${HOME}/bin/docker_clean.sh

#Call Backup script
${HOME}/bin/Backup.sh work
