#!/bin/bash
#This is a test file.
dir=/tmp/log_stat
t=`date +%d%H`
t1=`date +%H`
logdir=/data/log

[ -d $dir ] || mkdir $dir
[ -f $dir/$t.log ] && rm -f $dir/$t.log

cc(){
  for f in `find $logdir/ -type f`
    do
      > $f

    done
}

cf(){
  for f in `find $logdir/ -type f`
    do 
      du -sh $f >>$dir/$t.log
    done
}

if [ $t1 == "00" ]||[ $t1 == "12" ];then
  cc
else
  cf
fi

