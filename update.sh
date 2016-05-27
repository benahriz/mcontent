#!/bin/bash
NAME=$1
./yaml2json $1.yaml > $1.json
FILE=$1.json
NEWREV=`curl -s http://127.0.0.1:5982/maraton16/$NAME | jq -r '._rev'`
cat $FILE | jq "._rev=\"$NEWREV\"" > out.json
curl -v -H "Content-Type: appication/json" -X PUT --data @out.json http://127.0.0.1:5982/maraton16/$NAME