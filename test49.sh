#!/bin/bash
LANG=en
if [ -z $1 ];then
  echo "Usage: $0 if-name"
  exit 1
fi
sar -n DEV 1 10 | grep -w "$1" >/tmp/sar.tmp
in=`grep "Average:" /tmp/sar.tmp | awk '{print $5}' | sed 's/\.//g'`
out=`grep "Average:" /tmp/sar.tmp| awk '{print $6} ' | sed 's/\.//g'`
if [ "$in" == "000" ] && [ "$out" == "000" ];then
  ifdown $1
  ifup $1
else
  echo "$1 is OK."
fi

