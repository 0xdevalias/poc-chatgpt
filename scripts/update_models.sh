#!/usr/bin/env bash

models_json='./models.json'
models_txt='./models.txt'

if [ -z "$OPENAI_API_KEY" ]; then
  echo "Error: OPENAI_API_KEY is not set. Please run the following, then try again:"
  echo "  export OPENAI_API_KEY='YOUR-API-KEY'"
  exit 1
fi

echo "Updating ${models_json} / ${models_txt}"

curl --silent https://api.openai.com/v1/models -H "Authorization: Bearer ${OPENAI_API_KEY}" > "${models_json}"

jq -r '.data | sort_by(-.created) | .[] | ("\(.created | todate) \(.id)")' "${models_json}" > "${models_txt}"

echo 'Done!'
