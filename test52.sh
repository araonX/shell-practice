#!/bin/bash
iptables -nvL INPUT --line-numbers | grep "dpt:81" | awk '$4 ~/DROP|REJECT/ {print $1}' >/tmp/iptables.log
n=`wc -l /tmp/iptables.log | awk '{print $1}'`
if [ $n -gt 0 ];then
  for n1 in `tac /tmp/iptables.log`
    do
      iptables -D INPUT $n1
    done
fi
