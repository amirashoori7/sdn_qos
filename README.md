# sdn_qos
QoS implementation in Software Defined Network with Ryu Controller

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
and qos_simple_switch_13.py to ryu/ryu/app directory

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
