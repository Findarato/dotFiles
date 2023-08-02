#!/bin/bash

cd "${HOME}/dotFiles/" || exit

git pull -ff -q

git submodule foreach 'git reset --hard'