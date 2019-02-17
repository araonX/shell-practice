#!/bin/bash
/bin/bash -n $1 2>/tmp/error.txt
if [ $? -ne 0 ];then
  more /tmp/error.txt
  read -p "Please input yout choice:[Q|q for exit ,other anykey to vim $1 file]" cho
  case $cho in
  Q|q)
   exit
  ;;
  *)
   vi $1
  ;;
  esac
else
  echo "the script is ok."
  exit
fi
