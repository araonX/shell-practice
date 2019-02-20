#!/bin/bash
t=`date +%H`
echo $t
if [ $t -gt 00 ] && [ $t -le 12 ];then
  echo "deep moring."
elif [ $t -gt 12 ] && [ $t -le 18 ];then
  echo "Good afternoon." 
else
  echo "Good night."
fi

