#!/bin/bash

#set -x
token=$(cat response/session.prd.txt)
cookie=$(cat response/cookie.prd.txt | grep "JSESSIONID" | awk '{ print $7 }')
since_time=$(date "+%Y-%m-%dT%H:%M:%S")
until_time=$(date --date='+300 seconds' "+%Y-%m-%dT%H:%M:%S")
base_url=$(grep ccadmin .occ)

url_ccadmin_log="${base_url}/ccadmin/v1/logging?%20numArchiveFiles=7&includeArchives=true&since=${since_time}&until=${until_time}"
url_ccstore_log="${base_url}/ccstore/v1/logging?includeArchives=true&since=0&type=clientErrors&since=${since_time}&until=${until_time}"

curl -o response/ccstore.log.prd.json --location --request GET $url_ccstore_log \
--header 'Authorization: Bearer '$token 

sleep 10

curl -o response/ccadmin.log.prd.json --request GET --location  $url_ccadmin_log \
--header 'Authorization: Bearer '$token \
--form grant_type=client_credentials

exit 0
