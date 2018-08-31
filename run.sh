#!/bin/bash

# Prerequisites: 
#
# 1. Run git submodule update --init --recursive --remote
#
# 2. Generate the list:
# $ curl -s 'https://cs.chromium.org/codesearch/f/chromium/src/components/certificate_transparency/data/log_list.json' | jq -r '.logs[]|.url'
#
# 3. After the list is generated, manually review it, and comment out servers that are dead.

# 
# Then run the following query
#

echo "fetching get-sth from ct log list."
for api in $(cat ctlogs.txt | grep -v '^#')
do 
  api=${api%/}
  curl -s -m 10 --retry 3 -w '\n' https://$api/ct/v1/get-sth >> ct-get-sth-log/$api/timestamp.txt &
done
wait 

echo "done."
