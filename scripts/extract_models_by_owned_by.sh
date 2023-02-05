#!/usr/bin/env bash

models_json='./models.json'
grouped_json='./models_by_owned_by.json'

echo "Extracting models from ${models_json} and grouping them by owned_by"

jq -r '.data | sort_by(-.created) | map({ id: .id, owned_by: .owned_by, created: .created, created_iso8601: (.created | todate) }) | group_by(.owned_by) | map({ (.[0].owned_by): . }) | add' "${models_json}" > "${grouped_json}"

echo "Extracted models saved to ${grouped_json}
