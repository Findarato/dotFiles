#!/bin/bash
#find ./ -type f -name "*.m4v" | wc -l


#WORKING

# find $PWD -name "*.mkv"|while read fname; do

find $PDW \( ! -regex '.*/\..*' \) -type f -name "*.mp4"|while read -r fname; do
    VIDEODIR=$(dirname "$fname")
    VIDEONAME=$(basename "$fname")
    if [ ! -f "${VIDEODIR}/.${VIDEONAME}" ]; then
        # echo "Processing: ${VIDEONAME}"
        mkdir -p "$VIDEODIR/.process"
        mkdir -p "$VIDEODIR/encoded"
        MKVName="${VIDEONAME%.*}.mkv"
        ffmpeg -i "${fname}" -c copy -map 0 "./encoded/${MKVName}"
    else
        echo "Skipping: ${VIDEONAME}"
    fi
done


