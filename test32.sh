#!/bin/bash
if [ $# == 0 ];then
  ls -al .
else
  for d in $@ 
  do
    if [ -d $d ];then
      echo "$d dir contains:"
      find $d -type d
      echo -e "\033[31m++++++++++++\033[0m"
    else
      echo " This is not dir."
     fi
  done
fi  
