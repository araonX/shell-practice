#!/bin/bash
pp=$$
ps -elf | sed '1d' > /tmp/pid.txt
for pid in `awk -v pdn=$pp '$5!=pdn {print $4}' /tmp/pid.txt`
do
  if  [ -d /proc/$pid ];then
    echo " $pid is exit."
  else
    echo "$pid not exit."
  fi
done

