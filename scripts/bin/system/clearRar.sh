#!/usr/bin/env bash

DEST="/mnt/whitetower/storage/TV/"

find "${PDW}" -type f -name ".unrar*"  | while read -r fname; do
  echo "Removing ${fname}"
  rm -f "${fname}"
done
