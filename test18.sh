#!/bin/bash
change_file()
{    
  dir=/root/practice/sh
  date=`date +'%Y%m%d%H%M'`
  find $dir/ -type f -mmin -3600>/tmp/file.list
  n1=`wc -l /tmp/file.list | awk '{print $1}'`
  if [ $n1 -ne 0 ];then
    git add $dir/*.sh
    git commit -m "`date +"%Y-%m-%d %H:%M:%S"` commit"
    git push origin master
    if [ $? == 0 ];then
      echo "git push successfully." >>/tmp/$date.log
    fi
    echo "`date +"%D %H:%M:%S"`" >>/tmp/$date.log
    echo '===============================' >>/tmp/$date.log
    grep '.sh$' /tmp/file.list >> /tmp/$date.log
    echo '+++++++++++++++++++++++++++++++' >>/tmp/$date.log
  fi
}

while true
  do 
    mail_date=`date +%H:%M:%S`
    if [ "$mail_date" == "22:35:00" ];then
      change_file
      sn=`grep '.sh$' /tmp/file.list | wc -l | awk '{print $1}'`
      /usr/bin/mailx -s " Yesterday you Practiced $sn scirpts, Come On!" 568867090@qq.com < /tmp/$date.log
      sleep 10
    fi
  done

