#!/usr/bin/env bash


## Title: ~/dotfiles/scripts/bin/rpi-ping-test.sh
## Description: Run two iperf3 streams to the rpi-ping
## Author: Joseph Harry <findarato@gmail.com>
## Copyright (C): Joseph Harry 2026
## Date: 2026-05-26 14:38:10
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


#!/bin/bash

SESSION="flood-test"


tmux new-session -d -s $SESSION

tmux set -g base-index 1
tmux setw -g pane-base-index 1

tmux split-window -v

tmux select-pane -t 1
tmux send-keys 'sleep 5' Enter 'C-m'
tmux send-keys 'iperf3 -p 5201 --parallel 1 --no-delay -c 10.1.1.69 -tinf' 'C-m'
tmux resize-pane -U 5

tmux select-pane -t 2
tmux send-keys 'sleep 5' Enter 'C-m'
tmux send-keys 'iperf3 -p 5202 --parallel 1 --no-delay -c 10.1.1.98 -tinf' 'C-m'
tmux resize-pane -L 20



tmux -2 attach-session -d
