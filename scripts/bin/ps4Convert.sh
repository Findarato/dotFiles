#!/bin/bash
#find ./ -type f -name "*.m4v" | wc -l


#WORKING

# find $PWD -name "*.mkv"|while read fname; do

find $PDW \( ! -regex '.*/\..*' \) -type f -name "*.mp4"|while read -r fname; do
    VIDEODIR=$(dirname "$fname")
    VIDEONAME=$(basename "$fname")
    if [ ! -f "${VIDEODIR}/.${VIDEONAME}" ]; then
        echo "Processing: ${VIDEONAME}"
        mkdir -p "$VIDEODIR/.process"
        mkdir -p "$VIDEODIR/encoded"
        MKVName="${VIDEONAME%.*}.mkv"
        # echo "$VIDEODIR"
        # echo "$MKVName"
        echo "START" >> "${VIDEODIR}/.process/${MKVName}.txt"
        echo `date +%Y-%m-%d:%H:%M:%S` >> "${VIDEODIR}/.process/${MKVName}.txt"
        ffmpeg -y -i "${MKVName}" -map 0:v -c:v copy -map 0:a -c:a copy -map 0:a -strict -2 -c:a ac3 "${VIDEODIR}/encoded/${MKVName}"

        #'HandBrakeCLI -Z "Playstation 1080p30 Surround" -f av_mkv -i "$PWD/$VIDEONAME" -o "$PWD/process/${MKVName}" --json'
        echo "END" >> "${VIDEODIR}/.process/${MKVName}.txt"
        echo `date +%Y-%m-%d:%H:%M:%S` >> "${VIDEODIR}/.process/${MKVName}.txt"
        # 	cat "$PWD/process/$MKVName.json" >> ../.logs/process.json
    else
        echo "Skipping: ${VIDEONAME}"
    fi
done
