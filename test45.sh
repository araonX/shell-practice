#!/bin/bash
ip addr | grep inet | awk  '{print $2"/"$NF}'> /tmp/inter.txt
#more /tmp/inter.txt
while true
do
case $1 in
  -i)
    if [ -z $2 ];then
      echo "not input interface name."
      exit
    fi
    if [[ "$2" =~ ^eth[0-9]+$ ]] || [ $2 == "lo" ];then
      n1=`grep -we $2 /tmp/inter.txt | wc -l`
      if [ $n1 -eq 0 ];then
        echo "input error,please input a interface name on this system."
        exit
      else
        i_addr=`grep -we $2 /tmp/inter.txt | awk -F"/" '{print $1}'`
        echo "$2 interface ip is $i_addr"
        exit
      fi
    else
      echo "input error"
      exit    
    fi
    ;;
  -I)
    if [ -z $2 ];then
      echo "not input ip addr."
      exit
    fi
    if [[ "$2" =~ ^[0-9]{1,2}.*[0-9]{1,3}$ ]];then
      n2=`grep -we $2 /tmp/inter.txt | wc -l`
      if [ $n2 -eq 0 ];then
        echo "ip addr error,please re-input."
        exit
      else
        i_name=`grep -we $2 /tmp/inter.txt | awk -F"/" '{print $3}'`
        echo "IP $2 interface name is $i_name"
        exit
      fi
    else
      echo "input error."
      exit
    fi
    ;;
  *)
   echo "Usge: test45.sh -i interface | test45.sh -I IP "
   exit
   ;;
esac
done
