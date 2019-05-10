#!/bin/bash

INPUTFILE=$1
OUTPUTFILE=$2

openssl x509 -in ${INPUTFILE} -inform der -outform pem -out ${OUTPUTFILE}
