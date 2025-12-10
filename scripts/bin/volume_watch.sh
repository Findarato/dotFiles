#!/bin/bash

# Source: https://askubuntu.com/questions/1405632/set-or-limit-maximum-volume-output

LIMIT=50%

while true; do
  CURRENT_VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

  if [[ ${CURRENT_VOL%?} -gt ${LIMIT%?} ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ $LIMIT
  fi

  sleep 0.5
done
