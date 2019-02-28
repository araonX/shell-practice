#!/bin/bash
if [ -z $1 ] || [ -z $2 ];then
  echo "input error."
  exit
fi
n1=`echo $1 | awk -F'.' '{print $1}' `
n2=`echo $1 | awk -F'.'  '{print $2}'`
n3=`echo $2 | awk -F'.'  '{print $1}'`
n4=`echo $2 | awk -F'.'  '{print $2}'`

if [ $n1 -lt $n3 ] 2>/dev/null;then
  echo "$1 low $2"
elif [ $n1 -eq $n3 ] 2>/dev/null;then
  if [ $n2 -lt $n4 ] 2>/dev/null;then
    echo "$1 low $2"
  elif [ $2 -eq $4 ] 2>/dev/null;then
    echo "$1 equal $2"
  else
    echo "$1 rather $2"
  fi
else
  echo "$1 rather $2"
fi
