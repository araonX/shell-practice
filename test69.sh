#!/bin/bash
num1=`sed -n 10p /etc/passwd| cut -d: -f3`
num2=`sed -n 20p /etc/passwd| cut -d: -f3`
sum=$[$num1+$num2]
echo "users10th & user20th sum is:$sum"
