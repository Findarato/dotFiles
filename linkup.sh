#!/usr/bin/env bash

#
# This is for people who are running this directly
# It will remove current files and then create the
# symlinks
#


for FILE in .*; do
    if [ $FILE != .git ] && [ $FILE != . ] && [ $FILE != .. ]; then
        # echo "$FILE"
        echo "Linking Files"
        rm -f $HOME/$FILE
        ln -s $PWD/$FILE $HOME/$FILE
    fi
done
