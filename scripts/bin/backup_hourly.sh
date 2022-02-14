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

if [ ! -d ${BACKUP_SRC} ];then
    ${RESTIC} init --repo ${BACKUP_SRC}
fi

${RESTIC} cache --cleanup

${RESTIC} -r ${BACKUP_SRC} unlock  # Unlock repo

"${RESTIC}" -r "${BACKUP_SRC}" rebuild-index # Cleanup
#notify-send "Backing Up" "Restic backup running"

${RESTIC} -r ${BACKUP_SRC} backup ${BACKUP_SRC} --tag 🕐 --exclude-file=${EXCLUDE_FILE}

# Whole Home folder
"${RESTIC}" -r "${BACKUP_SRC}" forget --keep-hourly "${HOURS}" --keep-daily "${DAYS}" --keep-weekly "${WEEKS}" --keep-monthly "${MONTHS}"

"${RESTIC}" -r "${BACKUP_SRC}" prune # Cleanup

eval ${RUNAFTER}