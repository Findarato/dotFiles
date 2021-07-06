#!/bin/bash

## Config for work
USERNAME=jharry
EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
BACKUP_LOCATION=/mnt/box/
#BACKUP_LOCATION=/opt/backup/laptop/
export RESTIC_PASSWORD=$(pass computer/restic)

# Location of restic
RESTIC=/usr/bin/restic

#Retention settings
HOURS=12
DAYS=30
WEEKS=1
MONTHS=12

# Run After
RUNBEFORE="echo 'mounting Box';/usr/bin/rclone mount Box:/backup/laptop /mnt/box --daemon --allow-non-empty;sleep 20"
RUNAFTER="echo 'unmounting Box';sleep 60;fusermount -u /mnt/box"
