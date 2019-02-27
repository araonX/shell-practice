#!/bin/bash
f=./info/persontab.txt
group_n=5
member_n=`wc -l $f| awk '{print $1}'`
get_n(){
l=`echo $1|cksum|awk '{print $1}'`
n1=$RANDOM
n2=$[$n1+$l]
g_id=$[$n2%$group_n]
if [ $g_id -eq 0 ];then
   g_id=$group_n
fi
echo $g_id
}

for i in `seq 1 $group_n`
do
  [ -f /tmp/n_$i.txt ] && rm -f /tmp/n_$i.txt
done
shuf $f |while read name
do
  g=`get_n $name`
  echo $name >> /tmp/n_$g.txt
done

nu(){
  wc -l $1|awk '{print $1}'
}

max(){
  ma=0
  for i in `seq 1 $group_n | shuf`
  do
    n=`nu /tmp/n_$i.txt`
    if [ $n -gt $ma ];then
      ma=$n
    fi
  done
  echo $ma
}

min(){
  mi=$member_n
  for i in `seq 1 $group_n|shuf`
  do
    n=`nu /tmp/n_$i.txt`
    if [ $n -lt $mi ];then
      mi=$n
    fi
  done
  echo $mi
}

div(){
  n=`echo "scale=1;$1/$2"|bc`
  n1=`echo "scale=1;$1+0.5"|bc`
  echo $n1| cut -d. -f1
}

ava_n=$[$member_n/$group_n]
ava_n1=`div $member_n $group_n`
if [ $ava_n -eq $ava_n1 ];then
  ini_min=1
  while [ $ini_min -lt $ava_n1 ]
  do
    m1=`max`
    m2=`min`
    for i in `seq 1 $group_n|shuf`
    do
      n=`nu /tmp/n_$i.txt`
      if [ $n -eq $m1 ];then
        f1=/tmp/n_$i.txt
      elif [ $n -eq $m2 ];then
        f2=/tmp/n_$i.txt
      fi
    done
    name=`tail -n1 $f1`
    echo $name >> $f2
    sed -i "/$name/d" $f1
    ini_min=`min`
  done
else
  ini_max=$member_n
  while [ $ini_max -gt $ava_n1 ]
  do
    m1=`max`
    m2=`min`
    for i in `seq 1 $group_n | shuf `
    do 
      n=`nu /tmp/n_$i.txt`
      if [ $n -eq $m1 ];then
        f1=/tmp/n_$i.txt
      elif [ $n -eq $m2 ];then
        f2=/tmp/n_$i.txt
      fi
    done
    name=`tail -n1 $f1`
    echo $name >> $f2
    sed -i "/$name/d" $f1
    ini_max=`max`
  done
fi

for i in `seq 1 $group_n`
do
  echo -e "\033[34m$i members:\033[0m"
  cat /tmp/n_$i.txt
  rm -f /tmp/n_$i.txt
  echo 
done
    
