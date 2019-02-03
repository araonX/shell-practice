#!/bin/bash
dir=/var/log
date=`date +%F`
#mail=123@.com
[ -d $dir ] || mkdir -p $dir
df >>$dir/$date.log
df -i >>$dir/$date.log
df | sed '1d' | awk '{print $5,$6}'| awk -F% '$1>=85 {print $1,$2}' > $dir/df_tmp
df -i| sed '1d' | awk '{print $5,$6}'| awk -F% '$1>=85 {print $1,$2}' > $dir/df_i_tmp

n1=`wc -l $dir/df_tmp| awk '{print $1}'`
n2=`wc -l $dir/df_i_tmp| awk '{print $1}'`

if [ $n1 -gt 0 ];then
  if [ $n2 -gt 0 ];then
#    mail "both than 85 cat $dir/df_tmp $dir/df_i_tmp"
    echo "$?"
    
  else
    echo "$?"
#    mail "fenqu than 85% cat $dir/df_tmp"
  fi
else
  if [ $n2 -gt 0 ];then
    echo "$?"
#   mail "inode than 85% cat $dir/df_i_tmp"
  else
    echo "$?"
  fi
fi

