#!/bin/bash
curl http://127.0.0.1:5982/maraton16/$1 -o - | jq '.' > $1.json
ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < $1.json > $1.yaml
