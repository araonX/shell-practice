#!/bin/bash
find . -type f -name "*.sh" > file.list
for name in `cat file.list`
  do 
    mv $name $name.bak
  done 
for n in `cat file.list`
  do 
    echo $n.bak
  done > file.list.bak

tar -czvf 123.tar.gz `cat file.list.bak | xargs`

for f in `cat file.list`
  do 
    mv $f.bak $f
  done
