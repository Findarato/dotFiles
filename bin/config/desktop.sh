#!/bin/bash

## Config for home
USERNAME=joe

EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
BACKUP_LOCATION=/mnt/tarvalon/joe/Backups/Restic/
export RESTIC_PASSWORD=$(pass computer/restic)

# Location of restic
RESTIC=/usr/bin/restic

#Retention settings
DAYS=7
WEEKS=1
MONTHS=1
