#!/bin/bash
read -p "Please input a number: " n
n1=`echo $n |sed 's/[0-9]//g'`
if [ -n "$n1" ]
then
    echo "Please input a number."
    exit
fi
for i in `seq 1 $n`
do
    echo $i
done
read -p "If continue? y/n" c
case $c in  
n|N)
    exit
    ;;  
y|Y)
    read -p "Please input a number: " n2
    n3=`echo $n2|sed 's/[0-9]//g'`
    if [ -n "$n3" ]
    then
	echo "Please input a number."
	exit
    fi
    if [ $n2 -le $n ]
    then	
echo "$n2 should grater than $n."
        exit
    fi
    for i in `seq $[$n+1] $n2`
    do
	echo $i
    done
    ;;
  *)
    echo "Please input y or n."
    ;;
esac

