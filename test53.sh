#!/bin/bash
log=./info/access.log
awk -F':' '{if( $2>09 && $2 < 12) print $1}' $log | awk '{print $1}'| sort | uniq -c | sort -rn | head -n 1
