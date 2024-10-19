#!/bin/bash

# Domains to exclude from update. Separated by whitespace.
excluded_subdomains=()
zone_id=ZONE_ID_REQUIRED
token=Bearer_TOKEN_REQUIRED
IP=$(curl ip.me)

# GET DNS Record Details
cloudflare_result=$(curl --request GET \
  --url https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records \
  --header 'Content-Type: application/json' \
  --header "Authorization: Bearer $token")

result_count=$(echo $cloudflare_result | jq -r '.result_info.count')

for ((i = 0; i < $result_count; ++i)); do

  dns_record_id=$(echo $cloudflare_result | jq -r ".result[$i].id")
  zone_name=$(echo $cloudflare_result | jq -r ".result[$i].name")
  current_IP=$(echo $cloudflare_result | jq -r ".result[$i].content")

  if [[ $(echo ${excluded_subdomains[@]} | fgrep -w $zone_name) ]] || [[ "$IP" == "$current_IP" ]]; then
    continue
  fi

  # Update DNS Record
  curl --request PATCH \
    --url https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dns_record_id \
    --header 'Content-Type: application/json' \
    --header "Authorization: Bearer $token" \
    --data '{
  "comment": "Domain verification record",
  "name": "'$zone_name'",
  "proxied": false,
  "settings": {},
  "tags": [],
  "ttl": 300,
  "content": "'$IP'",
  "type": "A"
}'

done

# # List DNS Records
# curl --request GET \
#   --url https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records \
#   --header 'Content-Type: application/json' \
#   --header "Authorization: Bearer $token" | jq -r .result[]
