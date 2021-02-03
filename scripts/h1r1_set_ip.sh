#!/bin/bash

echo "removing IP address..." $'\n'
ip addr del 10.0.0.1/8 dev h1r1-eth0
echo $'\n' $?
echo "setting new IP address..." $'\n'
ip addr add 172.16.20.10/24 dev h1r1-eth0
echo $'\n' $?
echo "setting default route..." $'\n'
ip route add default via 172.16.20.1
echo $'\n' $?

