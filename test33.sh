#!/bin/bash
if [ -z $1 ] || [ -z $2 ];then
  echo "Please input URL & save dir."
  exit
else
  if [[ $1 =~ "^http.*" ]];then
    echo "Please a URL"
  fi
fi  
