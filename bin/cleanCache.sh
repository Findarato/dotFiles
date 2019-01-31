#!/bin/bash

CACHE_PATH="$HOME/.cache"
#rm -rf "$CACHE_PATH/.thumbs/*"
rm -rf "$CACHE_PATH/flatpak/*"

#Clean up browsers
rm -rf "$CACHE_PATH/vivaldi/*"
rm -rf "$CACHE_PATH/google-chrome/*"
rm -rf "$CACHE_PATH/google-chrome-beta/*"
rm -rf "$CACHE_PATH/mozilla/*"
rm -rf "$CACHE_PATH/chromium/*"

#Clean Up apps
rm -rf "$CACHE_PATH/libgweather/*"
rm -rf "$CACHE_PATH/gnome-software/*"
