#!/usr/bin/env bash

## Title: backup_ptyxis.sh
## Description: Backup script for the Ptyxis GNOME terminal profiles
## Author: Joseph Harry <findarato@gmail.com>
## Date: 2025-09-11 08:44:52

dconf dump /org/gnome/Ptyxis/Profiles/ > /home/joe/Documents/src/dconf/ptyxis.dconf.dump