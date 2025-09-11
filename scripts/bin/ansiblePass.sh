#!/usr/bin/env bash

## Title: ansiblePass.sh
## Description: Script to retrieve Ansible password from pass
## Author: Joseph Harry <findarato@gmail.com>
## Date: 2025-09-11 08:46:44

if [ -z "${1}" ]; then
    echo "Usage: ${0} variable"
    exit 1
fi
echo $(pass computer/ansible)
