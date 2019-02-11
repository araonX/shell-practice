#!/bin/bash
dir=/data/log
find $dir -type f > /tmp/file.list
[ -f /tmp/md5.list ] && rm -f /tmp/md5.list
while read line 
do
  md5sum $line >>/tmp/md5.list
done </tmp/file.list
more /tmp/md5.list

