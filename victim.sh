#!/bin/bash

echo "i am the victim" > victim.txt
systemctl restart NetworkManager
nmcli connection add type ethernet ifname 'eth0' con-name eth0
nmcli connection up id 'eth0'
