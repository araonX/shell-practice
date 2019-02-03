#!/bin/bash
ip=12.34.56.78
#ip=192.168.253.1
per=`ping -c 1 $ip | grep 'loss' | awk -F',' '{print $3}' | awk '{print $1}'`
if [ "$per" == "0%" ];then
  echo 'host is active.'
elif [ "$per" == "100%" ];then
  echo 'host is lost.'
fi

