#!/bin/bash
# Started December 6, 2019
# Requires badblocks

if [ -f "${1}" ];then
  if mount | grep "${1}" > /dev/null; then
    print "${1} Is mounted, please unmount"
  else
    badblocks -b 4096 -wsv "${1}"
 fi
fi
