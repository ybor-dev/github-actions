#!/bin/bash

# Read named command line arguments into an args variable
declare -A args
while (( "$#" )); do
    if  [[ $1 == --* ]] && [ "$2" ]; then
        args[${1:2}]=$2
        shift
    fi
    shift
done

# Trigger the action with curl
CURL_TARGET="${args[url]}"
BODY="{\"event_type\": \"${args[event_type]}\", \"client_payload\": ${args[client_payload]}}"
echo "${CURL_TARGET}"
echo "$BODY"
curl -X POST \
  -H "Accept: application/vnd.github.everest-preview+json" \
  -H "Authorization: token ${args[token]}" \
  ${CURL_TARGET} \
  --fail-with-body \
  -d "$BODY"
