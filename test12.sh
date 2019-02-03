#!/bin/bash
# case
echo "*cmd meau**  1 - date 2 - ls 3 - who 4 - pwd"
read -p "Please input a number:" choice
if [ -z "$choice" ];then
  echo "Please input a num,etc 1-4!"
  exit
fi
n1=`echo $choice | sed 's/[0-9]//g'`
if [ -n "$n1" ];then
  echo "not a mun."
  exit
fi

case $choice in
  1)
    date
    ;;
  2)
    ls
    ;;
  3)
    who
    ;;
  4)
    pwd
    ;;
  *)
    echo "error!"
esac
