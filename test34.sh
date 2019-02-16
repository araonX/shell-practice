#!/bin/bash
n=$[$RANDOM%101]
while true
do
  read -p "Please input a number:" n1
  if [ -z $n1 ];then
    echo "No Input,Please input a number."
    continue
  fi
  n2=`echo $n1 | sed 's/[0-9]//g'`
  if [ -n "$n2" ];then
     echo "Not a int number."
     continue
  fi
  
  if [ $n1 -lt $n ];then
    echo "low"
    continue
  elif [ $n1 -gt $n ];then
    echo "high"
    continue
  elif [ $n1 -eq $n ];then
    echo "success $n1."
    break
  fi
  
done
