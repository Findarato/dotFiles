#!/bin/bash

${HOME}/bin/cleanCache.sh

BACKUP_LOCATION=/mnt/home/backup/desktop

BACKUP_LOCATION=/run/media/joe/Backup/restic/


export RESTIC_PASSWORD=$(pass computer/restic)



restic init --repo ${BACKUP_LOCATION}



#Check Backup
/usr/bin/restic -r ${BACKUP_LOCATION} check

# rm -rf "${HOME}/.cache"

#Check Backup
/usr/bin/restic -r ${BACKUP_LOCATION} check

/usr/bin/restic -r ${BACKUP_LOCATION} unlock # Unlock repo 

/usr/bin/restic -r ${BACKUP_LOCATION} forget --keep-last 14 # Only keep 14 days

# Backup the system
/usr/bin/restic -r ${BACKUP_LOCATION} backup ${HOME} --exclude="${HOME}/.cache" --cleanup-cache=true --no-cache=true --exclude-file=resticExcludes.txt

#Prune Backups
/usr/bin/restic -r ${BACKUP_LOCATION} prune


#/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} check
#/usr/bin/restic --password-file ${HOME}/.backup_file -r ${BACKUP_LOCATION} forget --keep-last 14 --dry-run
