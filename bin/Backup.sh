#!/bin/bash

${HOME}/bin/cleanCache.sh

EXCLUDE_FILE="config/resticExcludes.txt"

BACKUP_LOCATION=/mnt/home/backup/desktop

BACKUP_LOCATION=/run/media/joe/Backup/restic/

export RESTIC_PASSWORD=$(pass computer/restic)

restic init --repo ${BACKUP_LOCATION}

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
/usr/bin/restic -r ${BACKUP_LOCATION} backup ${HOME} --tag CronBackup --exclude-file=${EXCLUDE_FILE}


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
