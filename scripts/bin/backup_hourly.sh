#!/bin/bash

if [ -f "${1}" ];then
    source "${1}"
else
    if [ -f "${HOME}/bin/config/${1}.sh" ];then
        source "${HOME}/bin/config/${1}.sh"
    else
        echo "Unable to load config file"
	    notify-send "Error" "Unable to load config file"
        exit;
    fi
fi

#${HOME}/bin/docker_clean.sh

eval ${RUNBEFORE}

${HOME}/bin/cleanCache.sh


echo "$(tput sgr0)"

if [ ! -d ${BACKUP_LOCATION} ];then
    ${RESTIC} init --repo ${BACKUP_LOCATION}
fi

${RESTIC} cache --cleanup

${RESTIC} -r ${BACKUP_LOCATION} unlock  # Unlock repo

echo "$(tput setaf 2)"
echo "██████╗  █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██████╗ ";
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ██║   ██║██╔══██╗";
echo "██████╔╝███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗██║   ██║██████╔╝";
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║██║   ██║██╔═══╝ ";
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝╚██████╔╝██║     ";
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝     ";
echo "$(tput sgr0)"
#notify-send "Backing Up" "Restic backup running"

${RESTIC} -r ${BACKUP_LOCATION} backup ${BACKUP_SRC} --tag 🕐 --tag hourly --exclude-file=${EXCLUDE_FILE}


#${RESTIC} -r ${BACKUP_LOCATION} backup ${HOME} --tag hourly --exclude-file=${EXCLUDE_FILE}
#${RESTIC} -r ${BACKUP_LOCATION} backup ${HOME} --exclude-file=${EXCLUDE_FILE}
#notify-send "Backing Up" "Restic backup ended"

# Whole Home folder
"${RESTIC}" -r "${BACKUP_LOCATION}" forget --keep-hourly "${HOURS}" --keep-daily "${DAYS}" --keep-weekly "${WEEKS}" --keep-monthly "${MONTHS}"

"${RESTIC}" -r "${BACKUP_LOCATION}" prune # Cleanup


eval ${RUNAFTER}
