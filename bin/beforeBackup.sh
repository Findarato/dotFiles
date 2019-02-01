#!/bin/bash

# Kill all of the running files that need to be backed up
pkill --signal 9 firefox
pkill --signal 9 chrome
pkill --signal 9 chromium
pkill --signal 9 vivaldi
pkill --signal 9 evolution
#NOW=$(date +%A.%H)
#updateRepos.sh

${HOME}/bin/cleanCache.sh

BACKUP_LOCATION=/mnt/home/backup/${HOSTNAME}

/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} unlock
#/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} forget --keep-last 14 --dry-run
/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} forget --keep-last 14

/usr/bin/restic --verbose --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} backup ${HOME} --exclude="${HOME}/.cache"


