#!/bin/bash
while true
do
  read -p "Please input a date(20190202):" d
  d1=`echo $d | sed 's/[0-9]//g'`
  if [ -n "$d1" ];then
    echo "Please input a num date, for example(20190202)."
    continue
  elif [ `echo $d | wc -L` -ne 8 ];then
    echo "input date not legal.exp(20190202)."
    continue
  else
    y=`echo $d | cut -b 1-4`
    m=`echo $d | cut -b 5-6`
    d=`echo $d | cut -b 7-8`
    if [ $m -ge 01 ] && [ $m -le 12 ];then
      if [ $m -eq 01 ] && [ $d -ge 01 ] && [ $d -le 31 ];then
        echo "date legal."
        continue
      elif [ $m -eq 02 ] && [ "$[$y%4]" == "0" ] && [ $d -le 29 ];then
        echo "date legal."
        continue
      fi
    else
      echo "month ilegal."
      continue
    fi
  fi
done
