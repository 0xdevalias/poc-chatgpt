#!/usr/bin/env bash

engines_json='./engines.json'
engines_txt='./engines.txt'

if [ -z "$OPENAI_API_KEY" ]; then
  echo "Error: OPENAI_API_KEY is not set. Please run the following, then try again:"
  echo "  export OPENAI_API_KEY='YOUR-API-KEY'"
  exit 1
fi

echo "Updating ${engines_json} / ${engines_txt}"

curl --silent https://api.openai.com/v1/engines -H "Authorization: Bearer ${OPENAI_API_KEY}" > "${engines_json}"

jq -r '.data[].id' "${engines_json}" > "${engines_txt}"

echo 'Done!'
