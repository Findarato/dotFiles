#!/bin/bash

${HOME}/bin/cleanCache.sh

BACKUP_LOCATION=/mnt/home/backup/${HOSTNAME}

rm -rf "${HOME}/.cache"

#Check Backup
/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} check

/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} unlock
#/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} forget --keep-last 14 --dry-run
/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} forget --keep-last 14

/usr/bin/restic --verbose --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} backup ${HOME} --exclude="${HOME}/.cache"

#Prune Backups
/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} prune
