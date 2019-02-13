#!/bin/bash
sum=0
for n in `seq 1 100`
do
  j=$[$n%3]
  if [ $j -eq 0 ];then
  sum=$[$sum+$n]
  fi
done
echo $sum
