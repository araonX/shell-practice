#!/bin/bash
supervisor_mail=xiejg@qq.com
while true
do 
  hc=$(netstat -tunlp | grep ':80 ' | wc -l)
  if [ "$hc" -eq "0" ];then
    /sbin/service httpd restart
    if [ $? == 0 ];then
      echo "service httpd restart success. "
    else
      echo "service httpd restart faild."
    fi
#   mail to supervisor 
    pn=$(pgrep -l httpd | wc -l)
    if [ "$pn" -eq "0" ];then
      echo "httpd restart faild, 80 port is not on run..."
    fi
  fi
  sleep 10
done
