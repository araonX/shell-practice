#!/bin/bash
for i in `seq 0 32767`
do
  m=`echo $i | md5sum | cut -c 1-8`
  echo $i $m
done >/tmp/md5.txt

cat > /tmp/c.txt << EOF
21029299
00205d1c
a3da1677
1f6d12dd
890684ba
EOF

grep -f /tmp/c.txt /tmp/md5.txt
