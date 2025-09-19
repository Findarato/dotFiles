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

      # Should turn this into a simple loop for all FF based browsers or something
      

      # Firefox
      flatpak override org.mozilla.firefox --user --filesystem=${FLATPAK}/org.mozilla.firefox/cache
      rm -rf ${HOME}/.var/app/org.mozilla.firefox/cache
      mkdir -p ${FLATPAK}/org.mozilla.firefox/cache
      ln -s ${FLATPAK}/org.mozilla.firefox/cache ${HOME}/.var/app/org.mozilla.firefox/cache

      # app.zen_browser.zen
      flatpak override app.zen_browser.zen --user --filesystem=${FLATPAK}/app.zen_browser.zen/cache
      rm -rf ${HOME}/.var/app/app.zen_browser.zen/cache
      mkdir -p ${FLATPAK}/app.zen_browser.zen/cache
      ln -s ${FLATPAK}/app.zen_browser.zen/cache ${HOME}/.var/app/app.zen_browser.zen/cache

      # one.ablaze.floorp
      flatpak override one.ablaze.floorp --user --filesystem=${FLATPAK}/one.ablaze.floorp/cache
      rm -rf ${HOME}/.var/app/one.ablaze.floorp/cache
      mkdir -p ${FLATPAK}/one.ablaze.floorp/cache
      ln -s ${FLATPAK}/one.ablaze.floorp/cache ${HOME}/.var/app/one.ablaze.floorp/cache

    fi
fi
