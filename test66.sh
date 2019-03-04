#!/bin/bash
ps -elf >/tmp/pid.txt
read -p "Please input a pid:" p
if [ -z "$p" ];then
  echo "you don't input any pid."
  exit
fi
if ! grep -qw "$p" /tmp/pid.txt;then
  echo "pid is not exit."
  exit
fi

get_cpid(){
  ps1=$1
  ps -elf | awk -v p2=$ps1 '$5==p2 {print $4 " " $NF}' >/tmp/$p1.txt
  n=`wc -l /tmp/$p1.txt | awk '{print $1}'`
  if [ $n -eq 0 ];then
    echo "$1 no child process."
  else
    echo "$1 child is:"
    cat /tmp/$p1.txt
  fi
}

get_cpid $p

