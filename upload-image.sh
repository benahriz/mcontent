#!/bin/bash
ABS=$(realpath $1)
DAYDIR=$(dirname $ABS)
DAY=$(basename $DAYDIR)
NEWREV=`curl -s http://127.0.0.1:5982/maraton16/$DAY | jq -r '._rev'`
mkdir -p kicsi
convert -resize 400 $1 kicsi/$1
curl -H "Content-Type: image/jpeg" -X PUT --data-binary @kicsi/$1 "http://127.0.0.1:5982/maraton16/$DAY/$1?rev=$NEWREV"