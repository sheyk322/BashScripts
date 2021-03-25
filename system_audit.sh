#!/bin/bash

echo "Up time:" && uptime | awk -F"," '{print $1}'

echo "###################"
w | sed 1d | awk '{print $1}'

echo "###################" 
w | sed 1d | awk '{print $4}'

echo "###################"
df -Ph | head -n 1; df -Ph | grep -E '/dev/sda1'

echo "###################"
top -b -o +%MEM | head -n 17 | tail -n 11

echo "###################"
ss -tup

echo "###################"
echo "Virtual Memory fields:"
vmstat -a | sed 1d | awk '{OFS="\t"} {print $3, $4, $5, $6}'
