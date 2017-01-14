#
# Taken from https://coderwall.com/p/i2hqda/investigate-http-response-times
# Credit goes to: adamstrawson
#
#!/bin/bash
CURL="/usr/bin/curl"

echo -n "Enter Url to test: "
read url

URL="$url"
result=`$CURL -o /dev/null -s -w %{time_connect}:%{time_starttransfer}:%{time_total} $URL`
IFS=':' read -a times <<< "${result}"

echo "Results: $URL"
echo "------------------------------------------------"
echo "| Connect Time | Transfer Start Time |  Total  |"
echo "------------------------------------------------"
echo "|   ${times[0]}ms    |       ${times[1]}ms       | ${times[2]}ms |"
echo "------------------------------------------------"
