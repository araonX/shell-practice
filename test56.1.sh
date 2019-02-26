#!/bin/bash
d=`date +%d`
d2=`date +%Y%m%d`

if [ “$d” == "01" ];then
  cd /etc/
  tar czf $d2_etc.tar.gz ./
fi
