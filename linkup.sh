#!/usr/bin/env bash

#
# This is for people who are running this directly
# It will remove current files and then create the
# symlinks
#




for FILE in .*; do
    if [ "$FILE" != .travis.yml ] && \
       [ "$FILE" != .git ] && \
       [ "$FILE" != . ] && \
       [ "$FILE" != .. ]; then
        # echo "$FILE"
        echo "Linking Files: $PWD/$FILE ==> $HOME/$FILE"
        rm -f "$HOME/$FILE"
        ln -s "$PWD/$FILE" "$HOME/$FILE"
    fi
done
