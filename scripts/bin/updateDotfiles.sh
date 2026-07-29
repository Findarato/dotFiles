#!/usr/bin/env bash

cd "${HOME}/dotfiles/" || exit

git pull -ff -q

git submodule foreach 'git reset --hard'