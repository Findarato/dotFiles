#!/usr/bin/env bash
DIRPATH="/mnt/cache"
APPS="${DIRPATH}/${USER}/apps"
BROWSERS="${DIRPATH}/${USER}/browsers"

if [ -d "${DIRPATH}" ]; then
    if [ ! -d "${APPS}" ]; then
        rm -rf ${HOME}/.cache/{google-chrome,libgweather,mozilla,shotwell,thumbnails,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
        rm -rf ${HOME}/.cache/{wal,shotwell,thumbnails,libgweather,thunderbird}
        rm -rf ${HOME}/.config/mpv/watch_later
        mkdir -p $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
        mkdir -p $APPS/{shotwell,thumbnails,libgweather,thunderbird,mpv/watch_later}
        ln -s $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium} ${HOME}/.cache/
        ln -s $APPS/{shotwell,thumbnails,libgweather,thunderbird} ${HOME}/.cache/
        ln -s $APPS/mpv/watch_later ${HOME}/.config/mpv/watch_later
    fi
fi