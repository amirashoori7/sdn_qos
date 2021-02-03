#!/bin/bash

switch_URL="http://localhost:8080/qos/rules/0000000000000001"
echo "getting switch 0000000000000001 settings..."
curl -X GET "$switch_URL"
