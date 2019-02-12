#!/bin/bash
for p in `ps aux | grep cleanen.sh | awk '{print $2}'`
  do
    echo $p
    kill -9 $p
  done
