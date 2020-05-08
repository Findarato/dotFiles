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

echo "$(tput setaf 2)"
echo "██████╗  █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██████╗ ";
echo "██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ██║   ██║██╔══██╗";
echo "██████╔╝███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗██║   ██║██████╔╝";
echo "██╔══██╗██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║██║   ██║██╔═══╝ ";
echo "██████╔╝██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝╚██████╔╝██║     ";
echo "╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝     ";
echo "$(tput sgr0)"

"${RESTIC}" -r "${BACKUP_LOCATION}" backup "${HOME}"  --tag 🌜 --tag nightly --exclude-file="${EXCLUDE_FILE}"

echo "$(tput setaf 2)"
echo "██████╗ ██████╗ ██╗   ██╗███╗   ██╗███████╗";
echo "██╔══██╗██╔══██╗██║   ██║████╗  ██║██╔════╝";
echo "██████╔╝██████╔╝██║   ██║██╔██╗ ██║█████╗  ";
echo "██╔═══╝ ██╔══██╗██║   ██║██║╚██╗██║██╔══╝  ";
echo "██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗";
echo "╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝";
echo "$(tput sgr0)"

# Whole Home folder
"${RESTIC}" -r "${BACKUP_LOCATION}" forget --keep-daily "${DAYS}" --keep-weekly "${WEEKS}" --keep-monthly "${MONTHS}"

"${RESTIC}" -r "${BACKUP_LOCATION}" prune # Cleanup

echo "$(tput setaf 2)"
echo " ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ";
echo "██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ";
echo "██║     ███████║█████╗  ██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗";
echo "██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║";
echo "╚██████╗██║  ██║███████╗╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝";
echo " ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ";
echo "$(tput sgr0)"

"${RESTIC}" -r "${BACKUP_LOCATION}" check


eval ${RUNAFTER}