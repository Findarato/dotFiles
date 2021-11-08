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
HOURS=12
DAYS=30
WEEKS=1
MONTHS=12

RUNBEFORE="echo 'mounting Box';rclone mount Box:/backup/desktop /mnt/box --daemon; sleep 20"
RUNAFTER="echo 'Unmounting Box';sleep 60;fusermount -u /mnt/box"
