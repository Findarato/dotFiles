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
DAYS=30
WEEKS=1
MONTHS=1

# Run After
RUNBEFORE="rclone mount Box:/backup/laptop /mnt/box --daemon"
RUNAFTER="fusermount -u /mnt/box"
