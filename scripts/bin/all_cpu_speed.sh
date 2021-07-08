#!/bin/bash
clear

#watch -n 1 'cat /proc/cpuinfo |grep MHz'

cat /proc/cpuinfo | grep 'MHz' | cut -c12-20 | sort -n -r
