#!/bin/bash
dev_count=`fdisk -l | grep "^/dev/*" | wc -l`
dev_name=`fdisk -l | grep "^/dev/*" | cut -d' ' -f1`
if [ $dev_count -eq 1 ];then
  echo "The filesystem has $dev_count device."
  df -h $dev_name
  exit 0
else
  echo "The filesystem has $dev_count device."
  dev_name_tail=`fdisk -l | grep "^/dev/*" | cut -d' ' -f1 | tail -n1`
  df -h $dev_name_tail
  exit 0
fi
