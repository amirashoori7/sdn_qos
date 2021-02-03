#!/bin/bash

echo "running ryu apps for diffserv experiments..." $'\n'
ryu-manager ryu/app/rest_qos.py ryu/app/qos_rest_router.py ryu/app/rest_conf_switch.py
