#!/bin/bash

DEST="/mnt/tarvalon/storage/TV/"

find "${PDW}" -type f -name ".unrar*"  | while read -r fname; do
  echo "Removing ${fname}"
  rm -f "${fname}"
done
