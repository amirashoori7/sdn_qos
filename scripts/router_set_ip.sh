#!/bin/bash

s1r1_router_URL="http://localhost:8080/router/0000000000000011"
echo "setting the IP address and for router s1r1..." $'\n'
curl -X POST -d '{"address": "172.16.20.1/24"}' "$s1r1_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "172.16.30.30/24"}' "$s1r1_router_URL"
echo $'\n' $?

s1_router_URL="http://localhost:8080/router/0000000000000001"
echo "setting the IP address and for router s1..." $'\n'
curl -X POST -d '{"address": "172.16.30.1/24"}' "$s1_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "172.16.10.1/24"}' "$s1_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "172.16.20.1/24"}' "$s1_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "192.168.10.1/24"}' "$s1_router_URL"
echo $'\n' $?

s1r4_router_URL="http://localhost:8080/router/0000000000000041"
echo "setting the IP address and for router s1r4..." $'\n'
curl -X POST -d '{"address": "192.168.30.1/24"}' "$s1r4_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "192.168.10.20/24"}' "$s1r4_router_URL"
echo $'\n' $?

