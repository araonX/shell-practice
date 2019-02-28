#!/bin/bash
N=5
mysql -uaming -ppasswd mydb -e "show tables" | sed '1d' >/tmp/table.txt
n=`wc -l /tmp/table.txt|awk '{print $1}'`

div(){
  n=`echo "scale=1;$1/$2"|bc`
  n1=`echo "scale=1;$n+0.5"|bc`
  echo $n1 | cut -d. -f1
}

n1=`div $n $N`
split -l $n1 /tmp/table.txt

myd(){
  for t in `cat $1`
  do
    mysqldump -uaming -ppasswd mydb $t > $t.sql
  done
}

for f in xaa xab xac xad xae
do
  myd $f &
done

wait

tar cvf mydb.tar.gz *.sql
rm -f *.sql
