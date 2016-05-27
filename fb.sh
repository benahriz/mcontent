#!/bin/bash
TOKEN=EAACEdEose0cBALBigtJWxtEQmZCs9p8ZCNIBLE8pc236qYoo5Ts9A6Y3reVejBbZCXb7qOyRm7kppp5mx7fIQs54q2t3XfMhpcwSFF1k3EPDqWWor3WVkdB9lsTEYJauI4Ig7G6XNhXZAgyXJZAPcPfcQaAItBXRlON1heT6ZC4wZDZD
curl -X GET "https://graph.facebook.com/v2.6/$1?fields=cover%2Cdescription%2Cdisplay_subtext%2Cdescription_html%2Cabout%2Cbio%2Cband_interests&access_token=$TOKEN" -o /tmp/$1.json
cat /tmp/$1.json | jq '.cover.source' | xargs -n1 -I XXX curl XXX -o $1.jpg
echo "  fb: https://www.facebook.com/$1"
echo "  image: $1.jpg"
echo "  desc: |-"
echo "    $(cat /tmp/$1.json | jq '.about')"
echo "---"
echo "    $(cat /tmp/$1.json | jq '.bio')"