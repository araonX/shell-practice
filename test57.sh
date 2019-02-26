#!/bin/bash
for w in `sed 's/[^a-zA-Z]/ /g' $1` 
do
  echo $w
done | sort | uniq -c | sort -nr | head -n 10
