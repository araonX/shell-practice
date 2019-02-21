#!/bin/bash
n=1
cat $1 | while read line 
do
  n1=$[$n%3]
  if [ $n1 -eq 0 ];then
    echo " $line"
  else
    echo -n " $line"
  fi
  n=$[$n+1]
done
