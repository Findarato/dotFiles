#!/bin/bash

${HOME}/bin/cleanCache.sh

BACKUP_LOCATION=/mnt/home/backup/desktop


export RESTIC_PASSWORD=$(pass computer/ansible)


#Check Backup
/usr/bin/restic -r ${BACKUP_LOCATION} check


EXPORT
# rm -rf "${HOME}/.cache"



#Check Backup
#/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} check
/usr/bin/restic -r ${BACKUP_LOCATION} check

/usr/bin/restic -r ${BACKUP_LOCATION} unlock
#/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} forget --keep-last 14 --dry-run
/usr/bin/restic -r ${BACKUP_LOCATION} forget --keep-last 14

/usr/bin/restic -r ${BACKUP_LOCATION} backup ${HOME} --exclude="${HOME}/.cache" --cleanup-cache=true --no-cache=true

#Prune Backups
/usr/bin/restic -r ${BACKUP_LOCATION} prune
