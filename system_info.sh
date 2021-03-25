#!/bin/bash

HostInfo=(
	"Host: $(hostname)" 
	"Kernel: $(uname -r)" 
	"Operating System: $(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)" 
	"Architecture: $(arch)" 
	"Processor: $(awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//')"
	)

echo '----------------'
echo 'Host info:'
echo '----------------' 

for i in "${HostInfo[@]}"; do
	echo $i
done

echo '----------------'
echo 'Interfaces info:'
echo '----------------'

for IF in $(ip link show | awk -F: '$1>0 {print $2}')
do
	echo -n "$IF: " 
	ip addr show dev "$IF" | awk '$1~/^inet/ {print $2}' | xargs
	
done

echo '----------------'
echo 'Firewall status:'
echo '----------------'

sudo ufw status | sed '/^$/d'

echo '----------------'
echo 'DNS info:'
echo '----------------'

sudo cat /etc/resolv.conf | sed 's/^#.*$//g; /^$/d'

echo '-------------------'
echo 'sysctl active vars:'
echo '-------------------'

sudo cat /etc/sysctl.conf | sed 's/^#.*$//g; /^$/d'