#!/bin/bash
while true
do
read -p "Please input a num:" n
  if [ -z $n ];then
    echo "Please input a num."
    continue
  fi
  if [ $n == "end" ];then
    break
    exit
  else
    if [ -n "`echo $n | sed 's/[0-9]//g'`" ];then
      echo "Please input a num."
      continue
    else
      echo "$n"
    fi
  fi
done
