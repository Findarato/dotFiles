#!/bin/bash

SERVICE="picom"

picom_status(){

  if pgrep -x "$SERVICE" >/dev/null 2>&1
  then
    echo "0"
  else
    echo "1"
  fi
}

case "$1" in
--toggle)
    if [ "$(picom_status)" = "0" ]; then
      killall -9 "$SERVICE"
      echo "Not Running"
    else
      picom -b > /dev/null 2>&1
      echo "Running"
    fi
    ;;
*)
    if [ "$(picom_status)" = "0" ]; then
        echo "Running"
    else
        echo "Not Running"
    fi
    ;;
esac