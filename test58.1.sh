#!/bin/bash
n=0
while read line
do
  n=$[$n+1]
  echo $n:$line >>/tmp/persontab.1.txt
done < ./info/persontab.txt

num_p=`wc -l /tmp/persontab.1.txt | awk '{print $1}'`
n2=1
while true
do
  if [ $n2 -lt 35 ];then
    while true
    do
      n1=$[$RANDOM%$num_p]
      if grep "$n1" /tmp/id_num.txt >/dev/null 2>&1;then
        continue
      else
        break
      fi
    done
      echo $n1 >>/tmp/id_num.txt
      grep -w "$n1" /tmp/persontab.1.txt >>/tmp/person.list
      n2=$[$n2+1]
  else
    break
  fi
done
more /tmp/person.list
rm -rf /tmp/persontab.1.txt
rm -rf /tmp/person.list
rm -rf /tmp/id_num.txt
