#!/bin/bash
ip add | awk -F ': ' '{print $2}' | sed '/^$/d' >/tmp/eths.list
more /tmp/eths.list
read -p "Please input your eth name:" eth
if [ -z $eth ];then
  echo "Please input a eth name."
else 
  n=`grep $eth /tmp/eths.list | wc -l| awk '{print $1}'`
  if [ $n == 0 ];then
    echo "eth name form error."
    exit
  fi
fi
if_ip()
{
  ifconfig $1 | grep 'inet' | awk '{print $2}' >/tmp/$1.list
  n=`cat /tmp/$1.list | wc -l | awk '{print $1}'`
  if [ $n -eq  0 ];then
    echo "$1 is not have ip."
  else
  for ip in `cat /tmp/$1.list`
    do
      echo -e "$1 have ip: \033[31m$ip\033[0m"
    done
  fi
}
if_ip $eth
