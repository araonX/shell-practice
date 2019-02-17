#!/bin/bash
f=/tmp/name_num.txt
while true
do
  read line
  if [ -z "$line" ];then
    break
  fi
  n=`echo $line | sed 's/[^0-9]/ /g' | wc -w`
  if [ $n -eq 1 ];then
    echo $line
  fi
  
done < $f
