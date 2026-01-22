#!/usr/bin/env bash

## Config for work
USERNAME=jharry
EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
# BACKUP_LOCATION=/mnt/home/backup/desktop
#BACKUP_LOCATION=/mnt/box/
BACKUP_LOCATION=s3:https://itc-tn-01.methnet.org:9000/joe.backup
BACKUP_SRC="${HOME}"


export RESTIC_PASSWORD=$(pass computer/restic)
export AWS_ACCESS_KEY_ID=$(pass computer/itc-tn-01/s3Access)
export AWS_SECRET_ACCESS_KEY=$(pass computer/itc-tn-01/s3AccessSecret)
# Location of restic
RESTIC=/usr/bin/restic

#Retention settings
HOURS=12
DAYS=30
WEEKS=1
MONTHS=12

RUNBEFORE=""
RUNAFTER=""
