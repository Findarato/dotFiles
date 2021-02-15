#!/bin/bash
printf "ifconfig.me\n"
curl -s https://ifconfig.me/ip -4
curl -s https://ifconfig.me/ip -6

printf "\n"

printf "icanhazip.com\n"
curl -s https://icanhazip.com -4
#curl -s https://icanhazip.com -6
