#!/bin/bash
mail_user=xxx@xx.com
m_mail(){
  log=$1
  t_s=`date +%s`
  t_s2=`date -d "1 hours ago" +%s`
  if [ ! -f /tmp/$log ];then
    touch /tmp/$log
    chattr +a /tmp/$log
    echo $t_s2 >>/tmp/$log
  fi
  t_s2=`tail -1 /tmp/$log | awk '{print $1}'`
  echo $t_s >>/tmp/$log
  v=$[$t_s-$t_s2]
  if [ $v -gt 1800 ];then
    python mail.py mail_user "CPU use than 90%." "`top -bn1`" 2>/dev/null
    echo "0" >/tmp/$log.count
  else
    if [ ! -f /tmp/$log.count ];then
      echo "0" >/tmp/$log.count
    fi
    nu=`cat /tmp/$log.count`
    nu2=$[$nu+1]
    echo $nu2 >/tmp/$log.count
    if [ $nu2 -gt 30 ];then
      python mail.py mail_user "CPU use more than 90%." "`top -bn1`" 2>/dev/null
      echo "0" >/tmp/$log.count
    fi
  fi
}

while true
do
  cpu_i=`top -bn1 | grep "Cpu(s):" |sed 's/^%//' | awk -F ' +|%' '{print $8}'`
  cpu_u=`echo 100-$cpu_i|bc`
  if [ $cpu_u -gt 90 ];then
    m_mail cpu
  fi
  sleep 60
  
done
