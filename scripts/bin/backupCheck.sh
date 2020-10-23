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

eval ${RUNBEFORE}

"${RESTIC}" -q -r "${BACKUP_LOCATION}" snapshots --path="${2}" --no-lock

"${RESTIC}" -r "${BACKUP_LOCATION}" rebuild-index


eval ${RUNAFTER}