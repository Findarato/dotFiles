#!/usr/bin/env bash

## Config for home
USERNAME=joe
BACKUP_SRC="${HOME}"

EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
BACKUP_LOCATION=s3:https://blacktower.mcharryville.space:9000/desktop-backup
TAGS="--tag 🕐 --tag desktop"

# Location of restic
RESTIC=/usr/bin/restic # Not flatpak based
#RESTIC=`/usr/bin/distrobox-enter --name backup -e 'restic'`

# Mostly needed for distrobx version
#PASS=`/usr/bin/distrobox-enter --name backup -e 'pass'`
PASS=/usr/sbin/pass

export RESTIC_PASSWORD=$(${PASS} computer/restic)
export AWS_ACCESS_KEY_ID=$(${PASS} computer/blacktower/s3Access)
export AWS_SECRET_ACCESS_KEY=$(${PASS} computer/blacktower/s3AccessSecret)


#Retention settings
HOURS=24
DAYS=30
WEEKS=4
MONTHS=0

RUNBEFORE=""
RUNAFTER=""