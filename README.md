# axel.wget-dialog--gauge
Process axel wget rsync curl output and send to dialog gui, including time left, speed and all output from the commands. 
Code for this already exist on the internet, but they only show progress, no time left, speed etc. So i decided to make my own.
It might have high CPU usage.
# Usage
./wget.sh "URL and options"


./axel.sh "URL and options"


./wget.sh -r images.google.com


./rsync /home/ /tmp/


./rsync --bwlimit 1024 /bin /home/Documents
