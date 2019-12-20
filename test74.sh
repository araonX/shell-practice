#!/bin/bash
for filename in $(ls /etc/rc.d/rc3.d); do
    if [ -z "$filename" ];then
	echo '/etc/rc.d/rc3.d is null.'
	exit 2
    fi
    if [[ "$filename" =~ ^K.* ]];then
	echo "$filename Start"
    elif [[ "$filename" =~ ^S.* ]];then
	echo "$filename Stop."
    else
	echo "can not pattern any file."
    fi
done
