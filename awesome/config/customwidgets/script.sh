#!/bin/bash

set -euo pipefail

source ~/dotfiles/exports.local

QUERY='from(bucket: "rasp-pi")
  |> range(start: -1h)
  |> filter(fn: (r) => r["_field"] == "temp")
  |> drop(fn: (column) => column != "_value" and column != "host")
  |> last()'

curl -s --request POST \
    ${INFLUXDB_HOST}/api/v2/query?org=willowpad \
    --header "Authorization: Token ${INFLUXDB_KEY}" \
    --header 'Accept: application/csv' \
    --header 'Content-type: application/vnd.flux' \
    --data "${QUERY}" | awk -F',' '{sub("\r", "", $NF); print $5, $4}' | sed 1d | sort | sed 1d
