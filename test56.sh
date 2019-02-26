#!/bin/bash
f=`date +%Y%m%d`_etc.tar.gz
tar -cvf $f `find /etc -type f | xargs` >/dev/null 2>&1
[ -d /root/bak ] || mkdir -p /root/bak
cp $f /root/bak


