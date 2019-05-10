#!/bin/bash

# notify-send "Restic backup started."

${HOME}/bin/cleanCache.sh

if [ -f ${1} ];then
    source ${1}
else
    # Defaulting to work setup
    EXCLUDE_FILE="${HOME}/bin/config/resticExcludes.txt"
    BACKUP_LOCATION=/run/media/joe/Backup/restic/
    BACKUP_LOCATION=/mnt/home/backup/desktop
    export RESTIC_PASSWORD=$(pass computer/restic)
    RESTIC=/usr/bin/restic
fi

echo "$(tput sgr0)"

export RESTIC_PASSWORD=$(pass computer/restic)

if [ ! -d ${BACKUP_LOCATION} ];then
    ${RESTIC} init --repo ${BACKUP_LOCATION}
fi

${RESTIC} -r ${BACKUP_LOCATION} unlock  # Unlock repo

echo "$(tput setaf 2)"
echo "██████╗  █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██████╗ ";
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ██║   ██║██╔══██╗";
echo "██████╔╝███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗██║   ██║██████╔╝";
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║██║   ██║██╔═══╝ ";
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝╚██████╔╝██║     ";
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝     ";
echo "$(tput sgr0)"
#${RESTIC} -r ${BACKUP_LOCATION} backup ${HOME} --tag 🕐 --tag hourly_backup --tag cron --exclude-file=${EXCLUDE_FILE}
${RESTIC} -r ${BACKUP_LOCATION} backup ${HOME}/Documents --tag 📂 --tag 15 --exclude-file=${EXCLUDE_FILE}

#notify-send "Restic backup ended."
