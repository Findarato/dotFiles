#!/bin/bash

DEST=/mnt/tarvalon/storage/TV/

find $PDW \( ! -regex '.*/\..*' \) -type f -name "*.mkv" | sort | while read fname; do
echo "Transfering ${fname}" | figlet -f future

rsync -aHAXxvu --numeric-ids --progress ${fname} ${DEST}
echo "Removing ${fname}" | figlet -f future
rm -f ${fname}

done

