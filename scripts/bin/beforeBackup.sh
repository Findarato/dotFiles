#!/usr/bin/env bash

## Title: beforeBackup.sh
## Description: Script to prepare the system before backup
## Author: Joseph Harry <findarato@gmail.com>
## Date: 2025-09-11 08:45:35

# Kill all of the running files that need to be backed up
pkill --signal 9 firefox
pkill --signal 9 chrome
pkill --signal 9 chromium
pkill --signal 9 vivaldi
#evolution --force-shutdown

pkill --signal 9 Enpass
NOW=$(date +%u)
#updateRepos.sh

"${HOME}/bin/cleanCache.sh"
#"${HOME}/bin/docker_clean.sh"

if [ -f "${1}" ];then
    source "${1}"
else
    if [ -f "${HOME}/bin/config/${1}.sh" ];then
        source "${HOME}/bin/config/${1}.sh"
        "${HOME}/bin/Backup.sh" ${1}
    else
        echo "Unable to load config file"
	      notify-send "Error" "Unable to load config file"
        exit;
    fi
fi

# Clean up Evolution
rm -rf "${HOME}/.cache/evolution/mail/"

# Backup Evolution
# Need to think about this one
# /usr/libexec/evolution/evolution-backup --display=:0 --restart --backup "${HOME}/evolution/evolution_backup_${NOW}.tar.gz"
# /usr/libexec/evolution/evolution-backup --display=:0 --restart --backup /mnt/box/evolution/evolution_backup_${NOW}.tar.gz

#Call Backup script

# Attemping to restore some of them

# Cleaning up some ram

#sync; echo 3 > /proc/sys/vm/drop_caches 

#swapoff -a && swapon -a
