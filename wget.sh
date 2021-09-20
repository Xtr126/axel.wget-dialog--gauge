#!/bin/bash
Loader() {
(
while read -r data
do
cat <<EOF
XXX
$(echo "$data" | stdbuf -o0 awk '{ print $7+0 }')
wget stdout raw -> $(echo "$data")
Download speed -> $(echo "$data" | stdbuf -o0 awk '{ print $8 }') Downloaded data -> $(echo "$data" | stdbuf -o0 awk '{ print $1 }')
Estimated time for end -> $(echo "$data" | stdbuf -o0 awk '{ print $9 }') 
XXX
EOF
done
) |
dialog --title "$URL" "$@" --gauge "Xtr" 10 55
}
wget "$@" 2>&1 | Loader

