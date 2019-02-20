#!/bin/bash
PS3="please input your choice(1-3)"
select i in w ls pwd quit
do
case $i in
  w)
    w
    ;;
  ls)
    ls
    ;;
  pwd)
    pwd
    ;;
  quit)
    exit
    ;;
  *)
    echo "Please input your choice(1-3)"
esac
done

cat << EOF
1) w
2）ls
3) pwd
4) quit
EOF
