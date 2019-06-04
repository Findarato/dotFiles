#!/bin/bash
clear

watch -c -t -n 1 "sensors | grep 'Tdie'| cut -c16-19 | figlet -f future"
