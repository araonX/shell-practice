#!/bin/bash
for ipaddr in $(seq 1 254);do
    losspercent=$(ping -w 1 192.168.253.$ipaddr | grep loss | cut -d',' -f3 | cut -d'%' -f1)
    if [ $losspercent -eq 0 ];then
	echo "192.168.253.$ipaddr is online."
    else
	echo "192.168.253.$ipaddr is offline."
    fi
done
