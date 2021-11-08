#!/bin/bash
clear

#watch -n 1 'cat /proc/cpuinfo |grep MHz'

SPEED=$(cat /proc/cpuinfo | grep 'MHz' | cut -c12-20 | sort -n -r | bc -l)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#echo "insert a number"
#read test

printf ${RED}
printf ${SPEED} 
#  printf ${TEMP} | figlet -f future
printf ${NC}
