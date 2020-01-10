#!/bin/bash
read -p "Please input username:" username
    until who | grep "^$username" &>/dev/null;do
        sleep 3
    done
echo "$username is login." >>/tmp/user.log

