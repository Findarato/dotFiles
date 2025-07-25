#!/usr/bin/env bash
DIRPATH="/mnt/cache"
APPS="${DIRPATH}/${USER}/apps"
BROWSERS="${DIRPATH}/${USER}/browsers"
FLATPAK="${DIRPATH}/${USER}/flatpak"

if [ -d "${DIRPATH}" ]; then
    if [ ! -d "${APPS}" ]; then
        rm -rf ${HOME}/.cache/{google-chrome,libgweather,mozilla,shotwell,thumbnails,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
        rm -rf ${HOME}/.cache/{wal,shotwell,thumbnails,libgweather,thunderbird}
        mkdir -p $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
        mkdir -p $APPS/{shotwell,thumbnails,libgweather,thunderbird,mpv/watch_later}
        ln -s $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium} ${HOME}/.cache/
        ln -s $APPS/{shotwell,thumbnails,libgweather,thunderbird} ${HOME}/.cache/

      # Flatpak Versions
      # Firefox

      rm -rf ${HOME}/.var/app/org.mozilla.firefox/cache
      mkdir -p ${FLATPAK}/org.mozilla.firefox/cache
      ln -s ${FLATPAK}/org.mozilla.firefox/cache ${HOME}/.var/app/org.mozilla.firefox/cache
    fi
fi