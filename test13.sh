#!/bin/bash
for i in `seq -w 00 09`
do
  useradd user_$i
  p=`< /dev/urandom tr -dc a-z-A-Z-0-9-|head -c ${1:-10};echo`  
  echo user_$i $p >>/tmp/user.info
  echo $p | passwd --stdin user_$i
done
