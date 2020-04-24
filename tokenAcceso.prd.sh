#!/bin/bash
#set -x

bearer=$(grep Bearer .occ)
base_url=$(grep ccadmin .occ)
curl -o response/token.prd.json --cookie-jar response/cookie.prd.txt --request POST \
  --url $base_url/ccadmin/v1/login \
  --header "${bearer}" \
  --header 'content-type: application/x-www-form-urlencoded' \
  --data grant_type=client_credentials


ls -ltr response/token.prd.json

          
python transform/getToken.py > response/session.prd.txt

./log.prd.sh 

#cat response/trace.out

python ./transform/logOCC.log.py prd > logs/ccstore_$(date '+%s').prd.out

python transform/logOCCAdmin.log.py prd > logs/ccadmin.$(date '+%s').prd.out

find logs/* -mtime +10 -exec rm {} \;

exit 0
