#!/bin/bash
for p in `ps -u $USER | awk '$NF ~ /YDService/ {print $1}'`
do
  kill -9 $p
done

pn=` ps -u $USER |awk '$NF ~ /YDService/ {print $1}'`
if [ -z $pn ];then
  echo "kill success."
else
  echo "kill faild."
fi
