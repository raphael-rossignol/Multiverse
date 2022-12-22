#!/bin/sh

# Automatisation installation de Gateway #

cd /etc/network
echo "auto eth0
iface eth0 inet static
        address 192.168.1.253
        netmask 255.255.255.0
        gateway 192.168.1.1
auto eth1
iface eth1 inet static
        address 192.168.10.253
        netmask 255.255.255.0" >> interfaces

/etc/init.d/networking restart

cd .

echo "net.ipv4.ip_forward=1" >> sysctl.conf

sysctl -p /etc/sysctl.conf

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo "iptables-save" >> /etc/iptables_rules.save
