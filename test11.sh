#!/bin/bash
c="Bash also interprets a number of multi-character options."
n=`echo $c | awk -F '[ +-.]' '{print $NF}'`
echo $n
for word in $c
  do 
  n=`echo $word | wc -L`
  if [ "$n" -lt 6 ];then
    echo $word
  fi    
  done
