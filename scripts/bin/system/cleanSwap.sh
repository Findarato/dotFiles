#!/usr/bin/env bash


## Title: cleanSwap.sh
## Description: Script to clean up swap space and free RAM
## Author: Joseph Harry <findarato@gmail.com>
## Date: 2025-09-11 09:25:22

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then 
   echo "Please run as root"
   exit
fi

sync; echo 3 > /proc/sys/vm/drop_caches 
swapoff -a && swapon -a
