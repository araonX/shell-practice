#!/bin/bash
# test /data/logs/access.log
# block ip or unblock ip
block_ip()
{
t1=`date -d "-1 min" +%Y:%H:%M`
log_dir=/data/logs/access.log
egrep "$t1[0-9]+" $log_dir > /tmp/tmp_last_min.log
awk '{print $1}' /tmp/tmp_last_min.log | sort -n | uniq	-c | sort -n | awk '$1 > 100 {print $2}' > /tmp/bad_ip.list
n=`wc -l /tmp/bad_ip.list|awk '{print $1}'`
if [ $n -ne 0 ];then 
  for ip in `cat /tmp/bad_ip.list`
    do 
      iptables -I INPUT -s $ip -j REJECT
    done
fi  
}

unblock_ip()
{
  iptables -nvL INPUT | sed '1d'|awk '$1<5 {print $8}' > /tmp/good_ip.list
  n=`wc -l /tmp/good_ip.list|awk '{print $1}'`
  if [ $n -ne 0 ];then
    for ip in `cat /tmp/good_ip.list`
      do 
        iptables -D INPUT -s $ip -j ACCEPT
      done
  fi
  iptables -Z
}

t=`date +%M`
if [ $t == "00" ] || [ $t == "30" ];then
  unblock_ip
  block_ip
else
  block_ip
fi
