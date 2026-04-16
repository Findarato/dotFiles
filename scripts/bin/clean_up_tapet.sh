#!/usr/bin/env bash
clear

TAPPET_PATH="${HOME}/Pictures/tapet/"

find ${TAPPET_PATH} -type f -mtime +180 -delete 