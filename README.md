## QoS Management Solution in Software Defined Networking using Ryu Controller

**This is my MSc thesis project repository, turned into a paper published at (IMPCS).**
> visit: https://impcs.zanjan.iau.ir/article_682091.html?lang=en

**Overview**

Enterprise networks are increasingly becoming larger and more dynamic due to vast deployments of virtualization technologies. Consequently, the explosion of new network applications and services has strained the capabilities of traditional networking architecture in terms of scalability, agility, and efficient traffic management. SDN (Software Defined Networking) is a novel approach to build networks in which control logic is decoupled from data forwarding in order to enable programmability and ease of configuration across the entire network. The centralized control in SDN provides a global view of the entire network resources and their performance which enables the innovation of new service models. This paper demonstrates the implementation of SDN in a sample data center network topology using Mininet and the RYU controller, followed by employing policy-based network management and a differentiated service mechanism for guaranteeing the QoS for different classes of traffic. The proposed framework is a foundation to develop an enterprise-level network control and management product. 

The approach of this paper is an implementation of a software-based architecture in the topology of a data center. It manages and guarantees the quality of service, using network policy-oriented management and service quality methods. The presented framework is an expandable infrastructure to solve the challenge of dynamic and agile management in the network of data centers and virtualization and cloud processing service providers.

![alt_text](https://github.com/amirashoori7/sdn_qos/blob/f6d57c8d29c403a016fb196da2a3b59768ccbc3a/demo_results/ryu_arch.jpg)

## Perflow QoS 
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/d6a423297848a2b4a2797cbabd6c4de2549bfbe5/demo_results/perflow%20results.jpg)

## Diffserv QoS
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/d6a423297848a2b4a2797cbabd6c4de2549bfbe5/demo_results/diffserv%20results.jpg)

## Further work: developing flow manager UI
![alt_text](https://github.com/amirashoori7/sdn_qos/blob/6fc9763209a50fdb0faadc1187d42617a597dd90/demo_results/flowmgr.jpg)

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
