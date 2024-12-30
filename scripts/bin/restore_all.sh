#!/bin/bash
# Started December 26, 2024
# Requires restic
# This should allow restoring with a configuration file
## example run restore_all.sh work

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

#${RESTIC} -r ${BACKUP_LOCATION} restore latest --overwrite if-changed --target ${HOME}   # Unlock repo

${RESTIC} -r ${BACKUP_LOCATION} restore latest --overwrite if-changed --target ${HOME} --dry-run -vv
