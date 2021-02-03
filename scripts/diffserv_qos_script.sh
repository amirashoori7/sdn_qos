#!/bin/bash

s1_URL="http://localhost:8080/v1.0/conf/switches/0000000000000001/ovsdb_addr"
s1r1_URL="http://localhost:8080/v1.0/conf/switches/0000000000000011/ovsdb_addr"
s1r4_URL="http://localhost:8080/v1.0/conf/switches/0000000000000041/ovsdb_addr"
echo "setting ovsdb_addr to access OVSDB..." $'\n'
curl -X PUT -d ' "tcp:127.0.0.1:6632" ' "$s1_URL"
echo $'\n' $?
curl -X PUT -d ' "tcp:127.0.0.1:6632" ' "$s1r1_URL"
echo $'\n' $?
curl -X PUT -d ' "tcp:127.0.0.1:6632" ' "$s1r4_URL"
echo $'\n' $?

s1_queue_URL="http://localhost:8080/qos/queue/0000000000000001"
s1r1_queue_URL="http://localhost:8080/qos/queue/0000000000000011"
s1r4_queue_URL="http://localhost:8080/qos/queue/0000000000000041"
echo "setting the queues params..." $'\n'
curl -X POST -d '{"port_name": "s1-eth1", "type": "linux-htb", "max_rate": "1000000", "queues":[{"max_rate": "1000000"}, {"min_rate": "200000"}, {"min_rate": "500000"}]}' "$s1_queue_URL"
echo $'\n' $?
curl -X POST -d '{"port_name": "s1r1-eth1", "type": "linux-htb", "max_rate": "1000000", "queues":[{"max_rate": "1000000"}, {"min_rate": "200000"}, {"min_rate": "500000"}]}' "$s1r1_queue_URL"
echo $'\n' $?
curl -X POST -d '{"port_name": "s1r4-eth1", "type": "linux-htb", "max_rate": "1000000", "queues":[{"max_rate": "1000000"}, {"min_rate": "200000"}, {"min_rate": "500000"}]}' "$s1r4_queue_URL"
echo $'\n' $?

s1_router_URL="http://localhost:8080/router/0000000000000001"
s1r1_router_URL="http://localhost:8080/router/0000000000000011"
s1r4_router_URL="http://localhost:8080/router/0000000000000041"
echo "setting the IP address and the default route for each router..." $'\n'
curl -X POST -d '{"address": "172.16.30.1/24"}' "$s1_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "172.16.20.1/24"}' "$s1r1_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "172.16.30.10/24"}' "$s1r1_router_URL"
echo $'\n' $?
curl -X POST -d '{"gateway": "172.16.30.1"}' "$s1r1_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "172.16.10.1/24"}' "$s1r4_router_URL"
echo $'\n' $?
curl -X POST -d '{"address": "172.16.30.11/24"}' "$s1r4_router_URL"
echo $'\n' $?
curl -X POST -d '{"gateway": "172.16.30.1"}' "$s1r4_router_URL"
echo $'\n' $?

s1_flow_URL="http://localhost:8080/qos/rules/0000000000000001"
s1r1_flow_URL="http://localhost:8080/qos/rules/0000000000000011"
s1r4_flow_URL="http://localhost:8080/qos/rules/0000000000000041"
echo "installing flow entry in accordance with DSCP value to the router s1 ..." $'\n'
curl -X POST -d '{"match": {"ip_dscp": "26"}, "actions":{"queue": "1"}}' "$s1_flow_URL"
echo $'\n' $?
curl -X POST -d '{"match": {"ip_dscp": "34"}, "actions":{"queue": "2"}}' "$s1_flow_URL"
echo $'\n' $?
echo "installing flow entry in accordance with DSCP value to the router s1r1 ..." $'\n'
curl -X POST -d '{"match": {"ip_dscp": "26"}, "actions":{"queue": "1"}}' "$s1r1_flow_URL"
echo $'\n' $?
curl -X POST -d '{"match": {"ip_dscp": "34"}, "actions":{"queue": "2"}}' "$s1r1_flow_URL"
echo $'\n' $?
echo "installing flow entry in accordance with DSCP value to the router s1r4 ..." $'\n'
curl -X POST -d '{"match": {"nw_dst": "172.16.20.10", "nw_proto": "UDP", "tp_dst": "5002"}, "actions":{"mark": "26"}}' "$s1r4_flow_URL"
echo $'\n' $?
curl -X POST -d '{"match": {"nw_dst": "172.16.20.10", "nw_proto": "UDP", "tp_dst": "5003"}, "actions":{"mark": "34"}}' "$s1r4_flow_URL"
echo $'\n' $?
