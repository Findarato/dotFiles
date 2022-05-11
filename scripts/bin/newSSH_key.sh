#!/bin/bash

if [ -f "${1}" ];then
  ssh-keygen -t ed25519 -f "${1}"
else
  print("KEY NAME MISSING")
fi
