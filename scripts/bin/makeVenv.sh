#!/usr/bin/env bash


## Title: makeVenv.sh
## Description: Script to create and activate a Python virtual environment
## Author: Joseph Harry <findarato@gmail.com>
## Copyright (C): Joseph Harry 2025
## Date: 2025-09-12 10:06:29
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## You should have received a copy of the GNU General Public License along
## with this program; if not, write to the Free Software Foundation, Inc.
## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

venvName=""

if [ -z "$1" ]; then
    echo -e "${RED}No virtual environment name supplied, using default: .venv${NC}"
    venvName=".venv"
else
    echo -e "${GREEN}Virtual environment name supplied: $1. Creating virtual environment...${NC}"
    venvName="$1"
fi

python3 -m venv "$venvName"

echo -e "${NC}Activating virtual environment: ${GREEN}$venvName${NC}"

echo "To activate the virtual environment, run:"
echo "source ${PWD}/${venvName}/bin/activate"