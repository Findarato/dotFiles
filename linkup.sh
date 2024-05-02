#!/usr/bin/env bash

# This is the restore script for stow. It must be ran from the directory it is located

stow bash --ignore=readme.md
stow git
# stow kitty
stow misc --ignore=readme.md
stow pass
stow tuir
stow scripts
stow sway
# stow Tilix
stow tmux
stow zsh
stow rofi
stow irssi
stow nano
stow starship
# stow dunst
stow Code
stow systemd
# stow wal
stow compton
# stow alacritty
stow distrobox
stow topgrade
