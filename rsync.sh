#!/bin/bash

if ! [ -x "$(command -v dialog)" ]; then echo "dialog needs to be installed first"; exit 1; fi
if ! [ -x "$(command -v rsync)" ]; then echo "rsync needs to be installed first"; exit 1; fi
if ! [ -x "$(command -v stdbuf)" ]; then echo "error: stdbuf not found"; exit 1; fi

# 0 - 2.81G
# 1 - 69%
# 2 - 330.67MB/s
# 3 - 0:00:03
# 4 - (xfr#2167, ir-chk=1289/3895)  

function process() {
while read -a data
do
echo XXX
echo "${data[1]//[!0-9]/}"
echo "Transferred data -> ${data[0]}"
echo "Speed ->>>>> ${data[2]}"
echo "Time left -> ${data[3]}"
echo "${data[4]} ${data[5]}" 
echo XXX
done
}

stdbuf -i0 -o0 -e0 rsync -ah --info=progress2 "$@" |  tr '\r' '\n' | process | dialog --title "rsync $*" --gauge "Initializing.." 10 50


