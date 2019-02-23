#!/bin/bash
d=`echo ${1:6:2}`
y=`echo ${1:0:4}`
m=`echo ${1:4:2}`

echo "`cal $m $y`"
