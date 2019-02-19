#!/bin/bash

BACKUP_LOCATION=/mnt/home/backup/desktop

export RESTIC_PASSWORD=$(pass computer/restic)

#Check Backup
/usr/bin/restic -q -r ${BACKUP_LOCATION} snapshots

