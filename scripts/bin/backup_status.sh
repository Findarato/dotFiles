#!/usr/bin/env bash

## Title: backup_status.sh
## Description: Check the status of backups
## Author: Joseph Harry <findarato@gmail.com>
## Date: 2025-09-11 08:45:02

if [ -f "${1}" ];then
    source "${1}"
else
    if [ -f "${HOME}/bin/config/${1}.sh" ];then
        source "${HOME}/bin/config/${1}.sh"
    else
        echo "Unable to load config file ${1}"
	      notify-send "Error" "Unable to load config file"

        exit;
    fi
fi
eval ${RUNBEFORE}

#Check Backup
echo "$(tput setaf 2)"
echo " ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ ";
echo "██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ ";
echo "██║     ███████║█████╗  ██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗";
echo "██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║";
echo "╚██████╗██║  ██║███████╗╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝";
echo " ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ";
echo "$(tput sgr0)"

#notify-send "Checking Backup" "Using Configuration ${1}"

"${RESTIC}" -q -r "${BACKUP_LOCATION}" snapshots --no-lock

#${RESTIC} -q -r ${BACKUP_LOCATION} stats

eval ${RUNEFTER}