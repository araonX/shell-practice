#!/bin/bash
if [ -z $1 ] || [ -z $2 ];then
  echo "Please input URL & save dir."
  exit
else
  if [[ "$1" =~ ^http.* ]];then
    if [ -d $2 ];then
      wget -P $2 $1 >/dev/null 2>&1
      if [ $? == 0 ];then
        echo "download success."
        exit 0
      else
        echo "download faild."
        exit 52
      fi
    else
      while true
      do
        read -p "Please choose Yes or No(Y|N)." ch
        case $ch in
        Y|y)
          mkdir -p $2
          wget -P $2 $1 >/dev/null 2>&1
          if [ $? == 0 ];then
            echo "download success."
            exit 0
          else
            echo "download faild."
            exit 52
          fi
          ;;
        N|n)
          exit 51
          ;;
        *)
          echo "Please input Y|N."
          continue
          ;;
         esac
       done
     fi
  else
    echo "Please a URL"
  fi
fi  
