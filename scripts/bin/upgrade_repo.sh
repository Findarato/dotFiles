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

#if [ ! -d ${BACKUP_LOCATION} ];then
#    ${RESTIC} init --repo ${BACKUP_LOCATION}
#fi

${RESTIC} cache --cleanup

${RESTIC} -r ${BACKUP_LOCATION} migrate upgrade_repo_v2

${RESTIC} -r ${BACKUP_LOCATION} prune --repack-uncompressed --compression max