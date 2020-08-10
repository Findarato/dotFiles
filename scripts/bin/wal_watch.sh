#!/bin/bash

inotifywait -m -e create -e moved_to ${1}|
    while read dir action file; do
        sleep 2;
        # echo "The file '$file' appeared in directory '$dir' via '$action'"
        echo "~/.local/bin/wal --backend colorz -n -i ${dir}${file}"
        "${HOME}/.local/bin/wal" -c
        "${HOME}/.local/bin/wal" --backend colorz -n -i "${dir}${file}"
        # "${HOME}/.local/bin/wal" --backend colorz -n -i "${dir}${file}"
        # do something with the file
    done


