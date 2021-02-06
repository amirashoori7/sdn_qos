#!/bin/sh

echo "setting openflow protocol version on Bridge s1r1..." $'\n'
ovs-vsctl set Bridge s1r1 protocols=OpenFlow13
echo $'\n' $?
ovs-vsctl set-manager ptcp:6632
echo $'\n' $?

