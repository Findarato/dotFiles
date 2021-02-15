#!/bin/bash

## Config for home
USERNAME=joe

EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
#BACKUP_LOCATION=/mnt/tarvalon/home/backup/desktop
#BACKUP_LOCATION=/mnt/tarvalon/storage/Backup/desktop
BACKUP_LOCATION=/mnt/blacktower/backup/joe/desktop
export RESTIC_PASSWORD=$(pass computer/restic)

# Location of restic
RESTIC=/usr/bin/restic

#Retention settings
DAYS=30
WEEKS=4
MONTHS=12

RUNBEFORE="systemctl --user stop psd"
RUNAFTER="systemctl --user start psd"