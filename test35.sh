#!/bin/bash
while true
do
read -p "Please inout a name:" name
if [ -z $name ];then
  echo "NO input name."
  continue
fi
if [ $name == "q" ] || [ $name == "Q" ];then
  break
fi
name1=`echo $name | sed 's/[a-zA-Z0-9]//g'`
if [ -n "$name1" ];then
  echo "not legal!"
  continue
else
  n=`grep -w $name /tmp/name_num.txt  2>/dev/null | wc -l`
  if [ $n -ne 0 ];then
    num1=`grep -w $name /tmp/name_num.txt | awk -F':' '{print $2}'`
    echo "$name:$num1"
    continue
  else
    echo $name 
    while true
    do
      num2=$[$RANDOM%100]
      n2=`awk -F':' '{print $2}' /tmp/name_num.txt 2>/dev/null| grep -w $num2 2>/dev/null | wc -l`
      if [ $n2 -ne 0 ];then
        echo "num is exit, please reinput name. "
        continue
      else
        echo $num2
        break
      fi
    done
    echo "$name:$num2" >>/tmp/name_num.txt
    continue
  fi  
fi
done

