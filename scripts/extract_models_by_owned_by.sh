#!/usr/bin/env bash

models_json='./models.json'
grouped_json='./models_by_owned_by.json'
grouped_txt_prefix='./models_'
grouped_txt_suffix='.txt'

echo "Extracting models from ${models_json} and grouping them by owned_by"

jq -r '.data | sort_by(-.created) | map({ id: .id, owned_by: .owned_by, created: .created, created_iso8601: (.created | todate) }) | group_by(.owned_by) | map({ (.[0].owned_by): . }) | add' "${models_json}" > "${grouped_json}"

for group in $(jq -r 'keys[]' "${grouped_json}"); do
  echo "  Extracting ${group}.."
  jq -r ".[\"$group\"][] | \"\(.created_iso8601) \(.id)\"" "${grouped_json}" > "${grouped_txt_prefix}${group}${grouped_txt_suffix}"
done

echo "Extracted models saved to ${grouped_json} / ${grouped_txt_prefix}*${grouped_txt_suffix}"
echo "Extracted models saved to ${grouped_json}
