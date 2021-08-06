#!/bin/bash

## Config for home
USERNAME=joe

EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
#BACKUP_LOCATION=/mnt/tarvalon/home/backup/desktop
#BACKUP_LOCATION=/mnt/tarvalon/storage/Backup/desktop
#BACKUP_LOCATION=/mnt/blacktower/backup/joe/desktop
BACKUP_LOCATION=s3:https://blacktower.telaranrhiod.space:9000/desktop-backup

export RESTIC_PASSWORD=$(pass computer/restic)
export AWS_ACCESS_KEY_ID=$(pass computer/blacktower/s3Access)
export AWS_SECRET_ACCESS_KEY=$(pass computer/blacktower/s3AccessSecret)

# Location of restic
RESTIC=/usr/bin/restic

#Retention settings
HOURS=24
DAYS=30
WEEKS=4
MONTHS=1

RUNBEFORE=""
RUNAFTER=""