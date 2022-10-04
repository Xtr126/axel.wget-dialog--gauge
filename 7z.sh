#!/bin/bash

function process() {
    while read -a data; do
        for str in "${data[@]}"; do
            echo XXX
            echo "${str//[!0-9]/}"
            echo "$(cat /tmp/7z_output.txt )"
            echo XXX
        done
    done
}

stdbuf -o0 -e0 7z -bso2 -bsp1 "$@" 2>/tmp/7z_output.txt | \
stdbuf -o0 tr '%' '\n' | process | dialog --title "7z $*" --gauge "Initializing.." 18 65 