#!/bin/bash

if ! [ -x "$(command -v dialog)" ]; then echo "dialog needs to be installed first"; exit 1; fi

# 0 - 100K 
# 6 - 67%
# 7 - 10.4K (speed)
# 8 - 2m28s (time)  

function process() {
    while read -a data; do
        echo XXX
        echo ${data[6]//[!0-9]/}
        echo "Download speed -> ${data[7]}"  
        echo "Downloaded data -> ${data[0]}"
        echo "Time left -> ${data[8]}"
        echo XXX
    done
}

wget "$@" 2>&1 | process | dialog --title "wget $*" --gauge "Initializing.." 8 40

