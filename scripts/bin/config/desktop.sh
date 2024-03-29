#!/bin/bash

## Config for home
USERNAME=joe
BACKUP_SRC="${HOME}"

EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
BACKUP_LOCATION=s3:https://blacktower.mcharryville.space:9000/desktop-backup
TAGS="--tag 🕐 --tag desktop"


export RESTIC_PASSWORD=$(pass computer/restic)
export AWS_ACCESS_KEY_ID=$(pass computer/blacktower/s3Access)
export AWS_SECRET_ACCESS_KEY=$(pass computer/blacktower/s3AccessSecret)

# Location of restic
RESTIC=/usr/bin/restic

#Retention settings
HOURS=24
DAYS=30
WEEKS=4
MONTHS=0

RUNBEFORE=""
RUNAFTER=""