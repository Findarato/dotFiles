#!/usr/bin/env bash

## Title: cer2pem.sh
## Description: Convert a DER encoded certificate to PEM format
## Author: Joseph Harry <findarato@gmail.com>
## Date: 2025-09-11 08:45:58

INPUTFILE="${1}"
OUTPUTFILE="${2}"

openssl x509 -in "${INPUTFILE}" -inform der -outform pem -out "${OUTPUTFILE}"
