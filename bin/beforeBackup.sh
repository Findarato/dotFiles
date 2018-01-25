#!/bin/bash
pkill --signal 9 firefox
pkill --signal 9 chrome
pkill --signal 9 chromium
pkill --signal 9 vivaldi
#NOW=$(date +%A.%H)
#updateRepos.sh

/usr/local/bin/restic --password-file ~/.backup_file -r /mnt/nas-tStorage/home/$HOSTNAME unlock
#/usr/local/bin/restic --password-file ~/.backup_file -r /mnt/nas-tStorage/home/$HOSTNAME forget --keep-last 14 --dry-run
/usr/local/bin/restic --password-file ~/.backup_file -r /mnt/nas-tStorage/home/$HOSTNAME forget --keep-last 14

/usr/local/bin/restic --password-file ~/.backup_file -r /run/media/joe/1A52AAB552AA94D3/$HOSTNAME unlock
/usr/local/bin/restic --password-file ~/.backup_file -r /run/media/joe/1A52AAB552AA94D3/$HOSTNAME forget --keep-last 30 --dry-run
/usr/local/bin/restic --password-file ~/.backup_file -r /run/media/joe/1A52AAB552AA94D3/$HOSTNAME forget --keep-last 30
