#!/bin/bash

sysctl -w net.ipv4.conf.all.rp_filter=2
sysctl net.ipv6.conf.all.forwarding=1

iptables --table nat --append POSTROUTING --jump MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
for each in /proc/sys/net/ipv4/conf/*
do
	echo 0 > $each/accept_redirects
	echo 0 > $each/send_redirects
done


/opt/swan/bin/ipsec/charon
