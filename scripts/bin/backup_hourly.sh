#!/bin/bash

# notify-send "Restic backup started."

${HOME}/bin/cleanCache.sh

if [ -f "${1}" ];then
    source "${1}"
else
    if [ -f "${HOME}/bin/config/${1}.sh" ];then
        source "${HOME}/bin/config/${1}.sh"
    else
        echo "Unable to load config file"
        exit;
    fi
fi

echo "$(tput sgr0)"

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
${RESTIC} -r ${BACKUP_LOCATION} backup ${HOME} --tag 🕐 --tag hourly --exclude-file=${EXCLUDE_FILE}

#notify-send "Restic backup ended."
