#!/bin/bash

set -euo pipefail

source ~/dotfiles/exports.local

QUERY='from(bucket: "rasp-pi")
  |> range(start: -15m)
  |> filter(fn: (r) => r["_field"] == "temp" or r["_field"] == "uptime")
  |> drop(fn: (column) => column != "_value" and column != "host" and column != "_field")
  |> last()'

curl -s --request POST \
    ${INFLUXDB_HOST}/api/v2/query?org=willowpad \
    --header "Authorization: Token ${INFLUXDB_KEY}" \
    --header 'Accept: application/csv' \
    --header 'Content-type: application/vnd.flux' \
    --data "${QUERY}" | \
    awk -F',' '{sub("\r", "", $NF); print $6,$5,$4}' | \
    grep -v '^_value\|^host' | \
    sort | sed '/^[[:space:]]*$/d'
