#!/usr/bin/env bash

## Title: all_cpu_speed.sh
## Description: Display the speed of all CPU cores
## Author: Joseph Harry <findarato@gmail.com>
## Date: 2025-09-11 08:46:37

clear

#watch -n 1 'cat /proc/cpuinfo |grep MHz'

cat /proc/cpuinfo | grep 'MHz' | cut -c12-20 | sort -n -r | uniq -u
