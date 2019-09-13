#!/bin/bash
clear
#watch -c -t -n 1 "sensors | grep 'Tdie'| cut -c16-19 | figlet -f future"

TEMP=$(sensors | grep 'Package id 0' | cut -c16-20 | bc -l)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#echo "insert a number"
#read test

printf ${RED}
printf ${TEMP} 
#  printf ${TEMP} | figlet -f future
printf ${NC}
