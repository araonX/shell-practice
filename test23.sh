#!/bin/bash
ethn=eth0
t=`date +"%Y-%m-%d %H:%M:%S"`
echo $t
logdir=/var/log/
[ -f $logdir/io.log ] && rm -f $logdir/io.log
[ -f $logdir/.io.log ] && rm -f $logdir/.io.log
sar -n DEV 1 59 | grep eth0 | grep Average >/var/log/.io.log
exec >>$logdir/io.log
echo -e "$t"
awk '{print "eth0 input:",$5*1000*8" bps","\n""eth0 output:",$6*1000*5" bps"}' $logdir/.io.log
echo -e "ooooooooooooooooooooooooooooooooooooo"
