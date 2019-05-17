wget -q -O - $(curl -s https://api.github.com/repos/stark/Color-Scripts/contents/color-scripts | jq '.[] | "\(.path) \(.download_url)"' -r | shuf -n1 | cut -d " " -f2) | bash
