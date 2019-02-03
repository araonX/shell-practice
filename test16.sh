#!/bin/bash
n=`cat /etc/redhat-release| awk -F 'release ' '{print $2}'| cut -d '.' -f1`
user()
{
  if [ $1 -eq 0 ];then
    echo 'no user.'
  else
    echo "$1 users." 
  fi 
}

case $n in 
  5|6)
    num=`awk -F: '$3>=500' /etc/passwd | wc -l `
    user $num
    ;;
  7)
    num=`awk -F: '$3>=1000' /etc/passwd | wc -l`
    user $num
    ;;
  *)
    echo 'Error!'
    ;;
esac
