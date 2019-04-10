#!/bin/bash

# notify-send "Restic backup started."

${HOME}/bin/cleanCache.sh

EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"

BACKUP_LOCATION=/run/media/joe/Backup/restic/

BACKUP_LOCATION=/mnt/home/backup/desktop

echo "$(tput sgr0)"

export RESTIC_PASSWORD=$(pass computer/restic)

if [ ! -d ${BACKUP_LOCATION} ];then

    restic init --repo ${BACKUP_LOCATION}
fi

/usr/bin/restic -r ${BACKUP_LOCATION} unlock  # Unlock repo

echo "$(tput setaf 2)"
echo "██████╗  █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██████╗ ";
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ██║   ██║██╔══██╗";
echo "██████╔╝███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗██║   ██║██████╔╝";
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║██║   ██║██╔═══╝ ";
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝╚██████╔╝██║     ";
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝     ";
echo "$(tput sgr0)"
#/usr/bin/restic -r ${BACKUP_LOCATION} backup ${HOME} --tag 🕐 --tag hourly_backup --tag cron --exclude-file=${EXCLUDE_FILE}
/usr/bin/restic -r ${BACKUP_LOCATION} backup ${HOME}/Documents --tag 📂 --tag 15 --exclude-file=${EXCLUDE_FILE}

#notify-send "Restic backup ended."
