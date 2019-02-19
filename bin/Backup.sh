#!/bin/bash

${HOME}/bin/cleanCache.sh

BACKUP_LOCATION=/mnt/home/backup/desktop


export RESTIC_PASSWORD=$(pass computer/restic)

# rm -rf "${HOME}/.cache"

#Check Backup
/usr/bin/restic -q -r ${BACKUP_LOCATION} check

/usr/bin/restic -q -r ${BACKUP_LOCATION} unlock # Unlock repo

/usr/bin/restic -q -r ${BACKUP_LOCATION} forget --keep-last 14 --prune # Only keep 14 days

# Backup the system
/usr/bin/restic -r ${BACKUP_LOCATION} backup ${HOME} --exclude="${HOME}/.cache" --cleanup-cache=true --no-cache=true --exclude-file=${HOME}/bin/resticExcludes.txt


#/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} check
#/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} forget --keep-last 14 --dry-run
