#!/bin/bash
log=./info/access.log
t=`date +%d/%b/%Y:1[01]:[0-5][0-9]:`
egrep "$t" $log | awk '{print $1}' | sort -n | uniq -c | sort -n |tail -1 | awk '{print $2}'
#egrep "$t" $log | awk '{print $1}' | sort -n | uniq -c |sort -n
