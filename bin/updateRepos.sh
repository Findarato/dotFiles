#!/bin/bash

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


NOW=$(date +%A.%H)

cd /home/joe/Documents/webapps/vagrantConfigs
git pull;
git push;
git add .
git commit -m "Nightly Commit $NOW";
git pull; git push;

cd /home/joe/Documents/src/dotFiles/
git pull;
git push;
git add .;
git commit -m "Nightly Commit $NOW";
git pull; git push;



cd /home/joe/Documents/webapps/packer-windows/
git pull

cd /home/joe/Documents/src/Wallhaven-Downloader
git pull
