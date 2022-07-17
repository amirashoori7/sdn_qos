# sdn_qos
QoS implementation in Software Defined Network with Ryu Controller

## 
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/f6d57c8d29c403a016fb196da2a3b59768ccbc3a/demo_results/ryu_arch.jpg)

## Perflow QoS 
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/8073791a8c0483c3da6cbd1e1f2b490659066917/demo_results/perflow.jpg)
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/8180fc18ff2323e2e2e06c21d0064147e7cf9008/demo_results/diffserv_results.jpg)

## Diffserv QoS
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/8180fc18ff2323e2e2e06c21d0064147e7cf9008/demo_results/diffserv.jpg)
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/8180fc18ff2323e2e2e06c21d0064147e7cf9008/demo_results/perflow_5001results.jpg)
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/8180fc18ff2323e2e2e06c21d0064147e7cf9008/demo_results/perflow_5002results.jpg)


## Getting started
create python virtual environment

```bash
pip install virtualenv
virtualenv --python=python3 envname
cd envname
source bin/activate
```

## install mininet
```bash
git clone git://github.com/mininet/mininet
mininet/util/install.sh -a
```

## install Ryu and its requirements
```bash
pip install eventlet msgpack-python netaddr oslo.config routes six webob
apt install libxml2-dev libxslt1-dev libffi-dev
git clone https://github.com/faucetsdn/ryu.git
cd ryu/
pip3 install .
```
Also in order to implement qos you need to copy qos_rest_router.py
and qos_simple_switch_13.py from ryu_qos_apps/ to ryu/ryu/app directory

## install iperf3
```bash
apt -y install iperf3
```

## install D-ITG
```bash
wget http://www.grid.unina.it/software/ITG/codice/D-ITG-2.8.1-r1023-src.zip
cd D-ITG-2.8.1-r1023/src/
make
```
