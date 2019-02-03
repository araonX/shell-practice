#!/bin/bash
awk '{ print $1 }' ../info/1.log |sort |  uniq -c | sort -n -r
