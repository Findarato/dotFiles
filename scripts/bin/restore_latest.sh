#!/bin/bash
# Started December 6, 2019
# Requires restic
# This should allow restoring with a configuration file
## example run restore_latest.sh work

${HOME}/bin/cleanCache.sh

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

${RESTIC} -r ${BACKUP_LOCATION} unlock  # Unlock repo

#${RESTIC} -r ${BACKUP_LOCATION} restore latst --target ${HOME}   # Unlock repo

#${RESTIC} -r ${BACKUP_LOCATION} restore 291e9cac --target /home/jharry/test --include "/home/jharry/.mozilla"  # Unlock repo

${RESTIC} -r ${BACKUP_LOCATION} restore 291e9cac --target "/"  --include "/home/jharry/.mozilla"  # Unlock repo


#${RESTIC} -r ${BACKUP_LOCATION} unlock  # Unlock repo

#${RESTIC} -r ${BACKUP_LOCATION} backup ${HOME} --tag 🕐 --tag hourly --exclude-file=${EXCLUDE_FILE} --verbose 2
