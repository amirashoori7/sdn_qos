#!/bin/bash

s1r1_router_URL="http://localhost:8080/router/0000000000000011"
echo "setting the default route for router s1r1..." $'\n'
curl -X POST -d '{"gateway": "172.16.30.1"}' "$s1r1_router_URL"
echo $'\n' $?

s1_router_URL="http://localhost:8080/router/0000000000000001"

s1r4_router_URL="http://localhost:8080/router/0000000000000041"
echo "setting the default route for router s1r4..." $'\n'
curl -X POST -d '{"gateway": "192.168.10.1"}' "$s1r4_router_URL"
echo $'\n' $?

echo "setting static route for s1 ..." $'\n'
curl -X POST -d '{"destination": "192.168.30.0/24", "gateway": "192.168.10.20"}' "$s1_router_URL"
echo $'\n' $?
echo "setting static route for s1 ..." $'\n'
curl -X POST -d '{"destination": "172.16.20.0/24", "gateway": "172.16.30.30"}' "$s1_router_URL"
echo $'\n' $?


