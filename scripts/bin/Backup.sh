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

if [ ! -d "${BACKUP_SRC}" ];then
    "${RESTIC}" init --repo "${BACKUP_SRC}"
fi

"${RESTIC}" -r "${BACKUP_SRC}" unlock  # Unlock repo

"${RESTIC}" -r "${BACKUP_SRC}" rebuild-index # Cleanup

"${RESTIC}" -r "${BACKUP_SRC}" backup "${HOME}"  --tag 🌞 --tag Full --exclude-file="${EXCLUDE_FILE}"

"${RESTIC}" -r "${BACKUP_SRC}" check --check-unused --read-data

# Whole Home folder
"${RESTIC}" -r "${BACKUP_SRC}" forget --keep-hourly "${HOURS}" --keep-daily "${DAYS}" --keep-weekly "${WEEKS}" --keep-monthly "${MONTHS}"

"${RESTIC}" -r "${BACKUP_SRC}" prune # Cleanup

eval ${RUNAFTER}