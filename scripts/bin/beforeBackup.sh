#!/bin/bash

# Kill all of the running files that need to be backed up
pkill --signal 9 firefox
pkill --signal 9 chrome
pkill --signal 9 chromium
pkill --signal 9 vivaldi
#pkill --signal 9 evolution
evolution --force-shutdown

pkill --signal 9 Enpass
NOW=$(date +%u)
#updateRepos.sh


"${HOME}/bin/cleanCache.sh"
#"${HOME}/bin/docker_clean.sh"

#Call Backup script
"${HOME}/bin/Backup.sh" work

# Clean up Evolution
rm -rf "${HOME}/.cache/evolution/mail/8fa38b6ad026c226d6cbaa8e0f506cdf4a54acea/folders/INBOX/subfolders"

# Backup Evolution
/usr/libexec/evolution/evolution-backup --display=:0 --restart --backup /mnt/home/backup/evolution/evolution_backup_${NOW}.tar.gz



# Attemping to restore some of them

# Cleaning up some ram

sync; echo 3 > /proc/sys/vm/drop_caches 

swapoff -a && swapon -a
