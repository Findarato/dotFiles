#!/bin/bash

## Config for work
USERNAME=jharry
EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
# BACKUP_LOCATION=/mnt/home/backup/desktop
BACKUP_LOCATION=/mnt/box/
export RESTIC_PASSWORD=$(pass computer/restic)

# Location of restic
RESTIC=/usr/bin/restic

#Retention settings
DAYS=30
WEEKS=1
MONTHS=1

RUNBEFORE="echo 'mounting Box';rclone mount Box:/backup/laptop /mnt/box --daemon"
RUNAFTER="echo 'Unmounting Box';fusermount -u /mnt/box"