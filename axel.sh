#!/bin/bash

if ! [ -x "$(command -v axel)" ]; then echo "axel needs to be installed first"; exit 1; fi
if ! [ -x "$(command -v dialog)" ]; then echo "dialog needs to be installed first"; exit 1; fi
if ! [ -x "$(command -v stdbuf)" ]; then echo "error: stdbuf not found"; exit 1; fi

function process() {
    while read -a data; do
        echo XXX
        echo "${data[1]//[!0-9]/}"
        echo "axel stdout -> ${data[@]}"
        echo "Download speed ->>>>> ${data[8]}"
        echo XXX
    done
}

stdbuf -o0 -e0 axel "$@" | process | \
    dialog --title "axel $*" --gauge "Initializing.." 10 50 
