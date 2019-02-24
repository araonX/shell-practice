#!/bin/bash
if [ -z $1 ];then
  echo "Please input web address."
  exit 2
fi
curl -I $1 2>/tmp/error.log >/tmp/curl.tmp
if [ $? == 0 ];then
  code=` head -n 1 /tmp/curl.tmp 2>/tmp/error.log| awk '{print $2}'`
  if [ $code -eq 200 ];then
    echo "web is ok."
  else
    echo "web is error."
  fi
else
  echo "not exit web"
fi
 
 
