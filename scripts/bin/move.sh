#!/bin/bash

DEST="/mnt/tarvalon/storage/TV/"

find "${PWD}" -type f -name "*.mkv" | sort | while read -r fname; do
#find "${PDW}" \( ! -regex '.*/\..*' \) -type f -name "*.mkv" | sort | while read -r fname; do
  echo "Transfering ${fname}" 

  rsync -aHAXxvu --numeric-ids --progress "${fname}" "${DEST}"
  echo "Removing ${fname}" 
  rm -f "${fname}"

done

