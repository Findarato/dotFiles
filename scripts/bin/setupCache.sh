#!/usr/bin/env bash
CACHEDIR="/mnt/cache"
APPS="${CACHEDIR}/${USER}/apps"
BROWSERS="${CACHEDIR}/${USER}/browsers"
FLATPAK="${CACHEDIR}/${USER}/flatpak"

if [ -d "${CACHEDIR}" ]; then
    if [ ! -d "${APPS}" ]; then
      rm -rf ${HOME}/.cache/{google-chrome,libgweather,mozilla,shotwell,thumbnails,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
      rm -rf ${HOME}/.cache/{wal,shotwell,thumbnails,libgweather,thunderbird}
      mkdir -p $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
      mkdir -p $APPS/{shotwell,thumbnails,libgweather,thunderbird,mpv/watch_later}
      ln -s $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium} ${HOME}/.cache/
      ln -s $APPS/{shotwell,thumbnails,libgweather,thunderbird} ${HOME}/.cache/

      # Flatpak Versions

      # Firefox
      flatpak override org.mozilla.firefox --user --filesystem=${FLATPAK}/org.mozilla.firefox/cache
      rm -rf ${HOME}/.var/app/org.mozilla.firefox/cache
      mkdir -p ${FLATPAK}/org.mozilla.firefox/cache
      ln -s ${FLATPAK}/org.mozilla.firefox/cache ${HOME}/.var/app/org.mozilla.firefox/cache

      # app.zen_browser.zen
      flatpak override app.zen_browser.zen --user --filesystem=${FLATPAK}/app.zen_browser.zen/cache
      rm -rf ${HOME}/.var/app/app.zen_browser.zen/cache
      echo "${FLATPAK}/app.zen_browser.zen/cache"
      mkdir -p ${FLATPAK}/app.zen_browser.zen/cache
      ln -s ${FLATPAK}/app.zen_browser.zen/cache ${HOME}/.var/app/app.zen_browser.zen/cache

    fi
fi

      flatpak override org.mozilla.firefox --user --filesystem=${FLATPAK}/org.mozilla.firefox/cache
      rm -rf ${HOME}/.var/app/org.mozilla.firefox/cache
      mkdir -p ${FLATPAK}/org.mozilla.firefox/cache
      ln -s ${FLATPAK}/org.mozilla.firefox/cache ${HOME}/.var/app/org.mozilla.firefox/cache