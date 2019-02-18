#!/bin/bash
for n in `seq 1 254`
do
  ipadr=192.168.253.$n
  n=`ping -c 1 $ipadr | grep packet | awk -F', ' '{print $3}' | awk -F'%' '{print $1}'`
  if [ $n == 0 ];then
    echo "$ipadr is up."
  else
    echo "$ipadr is down."
  fi
done 
