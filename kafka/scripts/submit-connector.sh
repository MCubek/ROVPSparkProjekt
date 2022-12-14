#!/bin/bash

# Submits a Kafka Connect connector.
# Takes a json file as input.
# ex: ./submit-connector.sh /path/to/my-connector.json

# Optionally add a second parameter to specify the connect host.
# ex: ./submit-connector.sh /path/to/my-connector.json my-connect-hostname


HEADER="Content-Type: application/json"
CONNECT_HOST=$2
CONNECT_HOST="${CONNECT_HOST:-localhost}"

echo -e "\nsubmitting connector $1\n"
echo -e "connecting to host $CONNECT_HOST\n"

DATA=$(envsubst < $1)

dockerize -wait http://$CONNECT_HOST:8083 -timeout 120s

curl -X POST -H "${HEADER}" --data "$DATA" http://$CONNECT_HOST:8083/connectors