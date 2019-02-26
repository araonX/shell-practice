#!/bin/bash
n1=1
while true
do
  read -p "Please input a stop num:" n
  if [ -z $n ];then
    echo "Not input stop num."
    continue
  fi
  c=`echo $n | sed 's/[0-9]//g'`
  if [ -n "$c" ];then
    echo "Please input a num."
    continue
  fi
  if [ $n -lt $n1 ];then
    echo "you should input a num big than $n1."
    continue
  fi
  for i in `seq $n1 $n`
  do
    echo  $i
  done
    n1=$[$n+1]
    while true 
    do
      read -p "Please choose your choice: Y/N ?" ch
      case $ch in
      Y|y)
        break
        ;;
      N|n)
        exit
        ;;
      *)
       echo "Please input your choice Y|N"
       continue
       ;;
      esac
    done
done

