#!/bin/bash

s1_URL="http://localhost:8080/v1.0/conf/switches/0000000000000001/ovsdb_addr"
s1r1_URL="http://localhost:8080/v1.0/conf/switches/0000000000000011/ovsdb_addr"
s1r4_URL="http://localhost:8080/v1.0/conf/switches/0000000000000041/ovsdb_addr"
echo "setting ovsdb_addr to access OVSDB..."
curl -X PUT -d ' "tcp:127.0.0.1:6632" ' "$s1_URL"
curl -X PUT -d ' "tcp:127.0.0.1:6632" ' "$s1r1_URL"
curl -X PUT -d ' "tcp:127.0.0.1:6632" ' "$s1r4_URL"

s1_queue_URL="http://localhost:8080/qos/queue/0000000000000001"
s1r1_queue_URL="http://localhost:8080/qos/queue/0000000000000011"
s1r4_queue_URL="http://localhost:8080/qos/queue/0000000000000041"
echo "setting the queue params..."
curl -X POST -d '{"port_name": "s1-eth1", "type": "linux-htb", "max_rate": "1000000", "queues": [{"max_rate": "500000"}, {"min_rate": "800000"}]}' "$s1_queue_URL"
curl -X POST -d '{"port_name": "s1r1-eth1", "type": "linux-htb", "max_rate": "1000000", "queues": [{"max_rate": "500000"}, {"min_rate": "800000"}]}' "$s1r1_queue_URL"
curl -X POST -d '{"port_name": "s1r4-eth1", "type": "linux-htb", "max_rate": "1000000", "queues": [{"max_rate": "500000"}, {"min_rate": "800000"}]}' "$s1r4_queue_URL"

s1_flow_URL="http://localhost:8080/qos/rules/0000000000000001"
s1r1_flow_URL="http://localhost:8080/qos/rules/0000000000000011"
s1r4_flow_URL="http://localhost:8080/qos/rules/0000000000000041"
echo "installing flow entry to the switch..."
curl -X POST -d '{"match": {"nw_dst": "10.0.0.1", "nw_proto": "UDP", "tp_dst": "5002"}, "actions":{"queue": "1"}}' "$s1_flow_URL"
curl -X POST -d '{"match": {"nw_dst": "10.0.0.1", "nw_proto": "UDP", "tp_dst": "5002"}, "actions":{"queue": "1"}}' "$s1r1_flow_URL"
curl -X POST -d '{"match": {"nw_dst": "10.0.0.1", "nw_proto": "UDP", "tp_dst": "5002"}, "actions":{"queue": "1"}}' "$s1r4_flow_URL"


