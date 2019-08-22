#!/bin/bash
echo "Change .MKV title to match its filename"
fileWhole="$1"
fileTitle="${1%.*}"
echo "${fileWhole}"
echo "${fileTitle}"
#mkvpropedit "$fileWhole" --edit info --set "title=$fileTitle"
