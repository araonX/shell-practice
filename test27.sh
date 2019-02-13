#!/bin/bash
#add delete user help
case $1 in
  --add)
    if [ ! $2 ];then
      echo "Please input add user."
      exit
    else
      echo "add user $2"
      for u in `echo $2 | sed 's/,/ /g'`
      do  
        useradd $u 2>/dev/null
        if [ $? -ne 0 ];then
          echo "user $u is exist."
        else
          echo "user $u add successful."
          echo $u | passwd $u --stdin 2>/dev/null 1>/dev/null
        fi 
      done
    fi
    ;;
  --delete)
    if [ ! $2 ];then
      echo "Please input del username."
      exit
    else
      echo "delete $2."
    fi
    n=`grep $2 /etc/passwd | wc -l`
    if ! id $2 >/dev/null 2>&1;then
      echo "user $2 is not exist."
      exit 200
    else
      userdel -rf $2 2>/dev/null 
      if [ $? -eq 0 ];then
        echo "del user $2 successful. "
      else
        echo "del user $2 faild."
      fi
    fi
    ;;
  --help)
    echo "The useage is test27.sh --add | --delete | user1,user2,user3."
    ;;
  *)
    echo "bad arguments!"
    ;;
esac
