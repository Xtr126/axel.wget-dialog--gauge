URL="http://localhost:8000/"

function Loader() {
(
while read -r data
do
cat <<EOF
XXX
$(echo "$data" | stdbuf -o0 awk '{ print $2+0 }'
axel stdout-> $(echo "$data" | stdbuf -o0 awk '{ print $0 }')
Download speed ->>>>> $(echo "$data" | stdbuf -o0 awk '{ print $8 }')
XXX
EOF
done
) |
dialog --title "$URL" "$@" --gauge "Xtr" 8 50 
}
axel "$URL" | Loader
sleep 10

