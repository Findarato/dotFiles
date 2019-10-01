#!/bin/bash

# Cleaning up some ram


if [ "$EUID" -ne 0 ]; then 
   echo "Please run as root"
   exit
fi

sync; echo 3 > /proc/sys/vm/drop_caches 
swapoff -a && swapon -a
