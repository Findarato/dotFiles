#!/bin/bash

# Kill all of the running files that need to be backed up
pkill --signal 9 firefox
pkill --signal 9 chrome
pkill --signal 9 chromium
pkill --signal 9 vivaldi
#evolution --force-shutdown

pkill --signal 9 Enpass
NOW=$(date +%u)
#updateRepos.sh


# Mount Box
/usr/bin/rclone mount Box:/backup/workDesktop /mnt/box/ --daemon

"${HOME}/bin/cleanCache.sh"
#"${HOME}/bin/docker_clean.sh"

# Clean up Evolution
rm -rf "${HOME}/.cache/evolution/mail/"

# Backup Evolution
/usr/libexec/evolution/evolution-backup --display=:0 --restart --backup /mnt/home/backup/evolution/evolution_backup_${NOW}.tar.gz
/usr/libexec/evolution/evolution-backup --display=:0 --restart --backup /mnt/box/evolution/evolution_backup_${NOW}.tar.gz

#Call Backup script
"${HOME}/bin/Backup.sh" work

# Attemping to restore some of them

# Cleaning up some ram

#sync; echo 3 > /proc/sys/vm/drop_caches 

#swapoff -a && swapon -a

#/usr/bin/rclone copy /mnt/home/backup Box:/backup/workDesktop/ --create-empty-src-dirs

fusermount -u /mnt/box
