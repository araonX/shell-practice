#!/bin/bash
test_login()
{
  while true 
  do
    n=`w |sed '1d'| awk '{print $1}'| grep -w $1| wc -l`
    if [ $n -ne 0 ];then
      echo -e "$1 is login."
      echo -e "`w | grep -w $1`"
    else
      echo "$1 is not login."
      exit
    fi
    sleep 300
  done
}

test_login $1
