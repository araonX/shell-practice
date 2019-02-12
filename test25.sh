#!/bin/bash
n=`netstat -tunlp | grep ':80'| wc -l`

if [ $n == 0 ];then
  echo "There is not open 80 port."
else
  ser=`netstat -tunlp | grep ':80'| awk -F'/' '{print $2}'| sed 's/ //g'`
  echo "80 port is open, service is $ser."
fi
