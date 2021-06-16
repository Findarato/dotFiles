#!/bin/bash
# Started December 6, 2019
# Requires badblocks
# This should allow restoring with a configuration file
## example run restore_latest.sh work



if [ -f "${1}" ];then
  if mount | grep "${1}" > /dev/null; then
    print "${1} Is mounted, please unmount"
  else
    badblocks -wsv "${1}"
fi
