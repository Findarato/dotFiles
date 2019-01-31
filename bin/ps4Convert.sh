#!/bin/bash
#find ./ -type f -name "*.m4v" | wc -l



#
# Code to actually conver the data
#

# for VIDEONAME in {*.mkv,*.mp4,*.m4v}; do
# 	echo $VIDEONAME
# 	if [ ! -f "$PWD/.$VIDEONAME" ]; then
# 		mkdir -p "$PWD/process"
# 		FILE=$(basename "$VIDEONAME")
# 		MKVName="${FILE%.*}.mkv"
# 		echo "START" >> "$PWD/.$MKVName"
# 		echo `date +%Y-%m-%d:%H:%M:%S` >> "$PWD/.$MKVName"
# 		HandBrakeCLI -Z "Playstation 1080p30 Surround" -f av_mkv -i "$PWD/$VIDEONAME" -o "$PWD/process/$MKVName" --json >> "$PWD/process/$MKVName.json"
# 		echo "END" >> "$PWD/.$MKVName"
# 		echo `date +%Y-%m-%d:%H:%M:%S` >> "$PWD/.$MKVName"
# 		cat "$PWD/process/$MKVName.json" >> ../.logs/process.json
# 	else
# 		echo "Skipping: $VIDEONAME"
# 	fi
# done
# find $PWD -name '*.mkv' > $(date +%Y-%m-%d).txt


#WORKING

# find $PWD -name "*.mkv"|while read fname; do

find $PDW \( ! -regex '.*/\..*' \) -type f -name "*.mkv"|while read fname; do
	VIDEODIR=$(dirname "$fname")
	VIDEONAME=$(basename "$fname")
	if [ ! -f "$VIDEODIR/.$VIDEONAME" ]; then
		echo "Processing: $VIDEONAME"
		# mkdir -p "$VIDEODIR/process"
		MKVName="${VIDEONAME%.*}.mkv"
		# echo "$VIDEODIR"
		# echo "$MKVName"
		echo "START" >> "$VIDEODIR/.$MKVName"
		echo `date +%Y-%m-%d:%H:%M:%S` >> "$VIDEODIR/.$MKVName"
		# ffmpeg -y -i "$MKVName" -map 0:v -c:v copy -map 0:a -c:a copy -map 0:a -strict -2 -c:a ac3 "$VIDEODIR/process/$MKVName"

		HandBrakeCLI -Z "Playstation 1080p30 Surround" -f av_mkv -i "$PWD/$VIDEONAME" -o "$PWD/process/$MKVName" --json >> "$PWD/process/$MKVName.json"
		echo "END" >> "$VIDEODIR/.$MKVName"
		echo `date +%Y-%m-%d:%H:%M:%S` >> "$VIDEODIR/.$MKVName"
	# 	cat "$PWD/process/$MKVName.json" >> ../.logs/process.json
	else
		echo "Skipping: $VIDEONAME"
	fi
done


# MOVIES=$(find $PWD -name '*.mkv')
# # # TEST=0
# for VIDEONAME in "$(find . -name \*.mkv)"; do

# 	if [ ! -f "$PWD/.$VIDEONAME" ]; then
# 		mkdir -p "$PWD/process"
# 		# mkdir -p "$PWD/process"
# 		FILE=$(basename "$VIDEONAME")
# 		MKVName="${FILE%.*}.mkv"
# 		echo "START" >> "$PWD/.$MKVName"
# 		echo `date +%Y-%m-%d:%H:%M:%S` >> "$PWD/.$MKVName"
# 		HandBrakeCLI -Z "Playstation 1080p30 Surround" -f av_mkv -i "$PWD/$VIDEONAME" -o "$PWD/process/$MKVName" --json >> "$PWD/process/$MKVName.json"
# 		echo "END" >> "$PWD/.$MKVName"
# 		echo `date +%Y-%m-%d:%H:%M:%S` >> "$PWD/.$MKVName"
# 		# cat "$PWD/process/$MKVName.json" >> "$PWD/.logs/process.json"
# 	else
# 		echo "Skipping: $VIDEONAME"
# 	fi
# done
