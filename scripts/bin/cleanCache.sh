#!/usr/bin/env bash


## Title: cleanCache.sh
## Description: Clean the cache files for random applications
## Author: Joseph Harry <findarato@gmail.com>
## Date: 2025-09-11 09:25:36



CACHE_PATH="${HOME}/.cache"
rm -rf "${CACHE_PATH}/.thumbs/*"
rm -rf "${CACHE_PATH}/flatpak/*"

#Clean up browsers
rm -rf "${CACHE_PATH}/vivaldi/*"
rm -rf "${CACHE_PATH}/google-chrome/*"
rm -rf "${CACHE_PATH}/google-chrome-beta/*"
rm -rf "${CACHE_PATH}/mozilla/*"
rm -rf "${CACHE_PATH}/chromium/*"

#Clean Up apps
rm -rf "${CACHE_PATH}/libgweather/*"
rm -rf "${CACHE_PATH}/gnome-software/*"
rm -rf "${CACHE_PATH}/evolution/mail/*"
