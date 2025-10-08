#!/bin/bash
printf "ifconfig.me\n"
curl -s https://ifconfig.me/ip -4
curl -s https://ifconfig.me/ip -6

printf "\n"

printf "ip.wtf\n"
curl ip.wtf