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

if [ ! -d "${BACKUP_LOCATION}" ];then
    "${RESTIC}" init --repo "${BACKUP_LOCATION}"
fi

"${RESTIC}" -r "${BACKUP_LOCATION}" unlock  # Unlock repo

"${RESTIC}" -r "${BACKUP_LOCATION}" rebuild-index # Cleanup

"${RESTIC}" -r "${BACKUP_LOCATION}" prune # Cleanup

echo "$(tput setaf 2)"
echo "██████╗  █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██████╗ ";
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ██║   ██║██╔══██╗";
echo "██████╔╝███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗██║   ██║██████╔╝";
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║██║   ██║██╔═══╝ ";
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝╚██████╔╝██║     ";
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝     ";
echo "$(tput sgr0)"

#"${RESTIC}" -r "${BACKUP_LOCATION}" backup "${HOME}"  --tag 🌞 --tag Daily --exclude-file="${EXCLUDE_FILE}"
"${RESTIC}" -r "${BACKUP_LOCATION}" backup "${HOME}" --exclude-file="${EXCLUDE_FILE}"

echo "$(tput setaf 2)"
echo " ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ";
echo "██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ";
echo "██║     ███████║█████╗  ██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗";
echo "██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║";
echo "╚██████╗██║  ██║███████╗╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝";
echo " ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ";
echo "$(tput sgr0)"

"${RESTIC}" -r "${BACKUP_LOCATION}" check --check-unused --read-data

"${RESTIC}" -r "${BACKUP_LOCATION}" check

"${RESTIC}" -r "${BACKUP_LOCATION}" rebuild-index


echo "$(tput setaf 2)"
echo "██████╗ ██████╗ ██╗   ██╗███╗   ██╗███████╗";
echo "██╔══██╗██╔══██╗██║   ██║████╗  ██║██╔════╝";
echo "██████╔╝██████╔╝██║   ██║██╔██╗ ██║█████╗  ";
echo "██╔═══╝ ██╔══██╗██║   ██║██║╚██╗██║██╔══╝  ";
echo "██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗";
echo "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝";
echo "$(tput sgr0)"

# Whole Home folder
"${RESTIC}" -r "${BACKUP_LOCATION}" forget --keep-hourly "${HOURS}" --keep-daily "${DAYS}" --keep-weekly "${WEEKS}" --keep-monthly "${MONTHS}"

"${RESTIC}" -r "${BACKUP_LOCATION}" prune # Cleanup



eval ${RUNAFTER}