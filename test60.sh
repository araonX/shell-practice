#!/bin/bash
while read line
  do
  if ! grep -q "$line" ./info/b.txt;then
    echo "$line" >>./info/c.txt
  fi
  done < ./info/a.txt
more ./info/c.txt
rm -f ./info/c.txt
