#!/bin/sh

echo "Waiting for OpenSearch..."

until curl -k -s \
    -u admin:MyStrongPassword123! \
    https://opensearch:9200/_cluster/health \
    | grep -q '"status"'
do
    echo "Waiting for OpenSearch Security..."
    sleep 5
done

echo "OpenSearch is ready."

echo "Installing ISM policy..."

curl -k \
    -u admin:MyStrongPassword123! \
    -X PUT \
    "https://opensearch:9200/_plugins/_ism/policies/delete-after-3-hours" \
    -H "Content-Type: application/json" \
    -d @/config/ism/delete-after-3-hours.json


echo
echo "Installing index template..."

curl -k \
    -u admin:MyStrongPassword123! \
    -X PUT \
    "https://opensearch:9200/_index_template/logs-template" \
    -H "Content-Type: application/json" \
    -d @/config/templates/logs-template.json

echo
echo "Initialization complete."