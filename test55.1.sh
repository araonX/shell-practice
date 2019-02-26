#!/bin/bash
n=0
cat ./info/1.txt | while read line 
do
  n=$[$n+1]
  if [ $n -eq 5 ];then
    echo -e "# test.\n# test insert."
    echo $line
  else
    echo $line
  fi
done 
