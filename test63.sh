#!/bin/bash
s_ip=14.215.177.38
url=www.baidu.com/index.php
ipf=/data/ip.list

curl -x$s_ip:80 $url 2>/dev/null >/tmp/source.txt
for ip in `cat $ipf`
do
  curl -x$ip:80 $url 2>/dev/null >/tmp/$ip.txt
  diff /tmp/source.txt /tmp/$ip.txt >/tmp/$ip.diff
  n=`wc -l /tmp/$ip.diff|awk '{print $1}'`
  if [ $n -gt 0 ];then
    echo "$ip is error."
  fi
done
