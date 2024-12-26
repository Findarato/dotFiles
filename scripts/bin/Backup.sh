#!/bin/bash

# notify-send "Restic backup started."

"${HOME}/bin/cleanCache.sh"

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

eval ${RUNBEFORE}

echo "$(tput sgr0)"

if [ "${2}" = "init" ];then
    "${RESTIC}" init --repo "${BACKUP_LOCATION}"
fi


"${RESTIC}" --repo "${BACKUP_LOCATION}" unlock  # Unlock repo

"${RESTIC}" --repo "${BACKUP_LOCATION}" repair index # Cleanup

"${RESTIC}" --repo "${BACKUP_LOCATION}" backup "${HOME}"  --tag 🌞 --tag Full --exclude-file="${EXCLUDE_FILE}"

"${RESTIC}" --repo "${BACKUP_LOCATION}" check --read-data

# Whole Home folder
"${RESTIC}" --repo "${BACKUP_LOCATION}" forget --keep-hourly "${HOURS}" --keep-daily "${DAYS}" --keep-weekly "${WEEKS}" --keep-monthly "${MONTHS}"

"${RESTIC}" --repo "${BACKUP_LOCATION}" prune # Cleanup

eval ${RUNAFTER}