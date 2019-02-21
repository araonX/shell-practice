#!/bin/bash
get_number(){
 echo $[$RANDOM%900+100]
}

if [ $# -eq 0 ];then
  get_number
fi

if [ $# -eq 1 ];then
  n1=`echo $1 | sed 's/[0-9]//g'`
  if [ -n "$n1" ];then
    echo "Please input a number."
  else
    for n in `seq 1 $1`
    do
      get_number
    done
  fi
elif [ $# -gt 1 ];then
  echo "Usage sh $0 n ." 
fi 

