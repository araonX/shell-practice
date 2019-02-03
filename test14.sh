#!/bin/bash
httpd_c=`ps aux | grep httpd | grep -v grep | wc -l`
httpd_p=`pgrep -l httpd | wc -l`
while true
  do 
    if [ "$httpd_c" -ge "6" ];then
      i=0
      while [ $i -lt 5 ]
        do 
          /sbin/service httpd restart 2>>/tmp/apache.log
          if [ -z $httpd_p ];then
            i=$(($i+1))
            continue
          else
            sleep 5
            if [ $httpd_c -lt 8 ];then
              break
            else
             echo  "`date +'%Y-%m-%d %H:%M:%S'` mail to supervisor httpd_count is over 6." >>/tmp/apache.log
              exit
            fi
          fi 
        done
      if [ -z $httpd_p ];then
        echo "`date +%D` mailto supervisor httpd restart faild. " >>/tmp/apache.log
        exit
      fi
    fi
    sleep 10
    echo 'sleep 10' >>/tmp/apache.log
  done
