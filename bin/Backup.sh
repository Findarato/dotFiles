#!/bin/bash

${HOME}/bin/cleanCache.sh

BACKUP_LOCATION=/mnt/home/backup/desktop


export RESTIC_PASSWORD=$(/usr/bin/pass computer/restic)

# rm -rf "${HOME}/.cache"

echo "$(tput sgr0)"
/usr/bin/restic -r ${BACKUP_LOCATION} unlock  # Unlock repo

echo "$(tput setaf 2)"
echo "██████╗  █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██████╗ ";
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ██║   ██║██╔══██╗";
echo "██████╔╝███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗██║   ██║██████╔╝";
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║██║   ██║██╔═══╝ ";
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝╚██████╔╝██║     ";
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝     ";

echo "$(tput sgr0)"
/usr/bin/restic -r ${BACKUP_LOCATION} backup ${HOME} --tag CronBackup --exclude-file=${HOME}/bin/resticExcludes.txt 


echo "$(tput setaf 2)"
echo " ██╗██╗  ██╗    ██████╗  █████╗  ██████╗██╗  ██╗██╗   ██╗██████╗ ███████╗";
echo "███║██║  ██║    ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║   ██║██╔══██╗██╔════╝";
echo "╚██║███████║    ██████╔╝███████║██║     █████╔╝ ██║   ██║██████╔╝███████╗";
echo " ██║╚════██║    ██╔══██╗██╔══██║██║     ██╔═██╗ ██║   ██║██╔═══╝ ╚════██║";
echo " ██║     ██║    ██████╔╝██║  ██║╚██████╗██║  ██╗╚██████╔╝██║     ███████║";
echo " ╚═╝     ╚═╝    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝";

echo "$(tput sgr0)";
/usr/bin/restic -r ${BACKUP_LOCATION} forget --keep-daily 14 --prune  # Only keep 14 days

echo "$(tput setaf 2)"
echo "██████╗ ██████╗ ██╗   ██╗███╗   ██╗███████╗";
echo "██╔══██╗██╔══██╗██║   ██║████╗  ██║██╔════╝";
echo "██████╔╝██████╔╝██║   ██║██╔██╗ ██║█████╗  ";
echo "██╔═══╝ ██╔══██╗██║   ██║██║╚██╗██║██╔══╝  ";
echo "██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗";
echo "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝";

echo "$(tput sgr0)"
/usr/bin/restic -r ${BACKUP_LOCATION} prune # Cleanup

#Check Backup

echo "$(tput setaf 2)"
echo " ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ";
echo "██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ";
echo "██║     ███████║█████╗  ██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗";
echo "██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║";
echo "╚██████╗██║  ██║███████╗╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝";
echo " ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ";


echo "$(tput sgr0)"
/usr/bin/restic -r ${BACKUP_LOCATION} check
