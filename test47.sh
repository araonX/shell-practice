#!/bin/bash
if_install(){
 rpm -q $1 >/dev/null 2>&1
if [ $? -eq 0 ];then
  echo "$1 is installed."
  return 0
else
  echo " $1 is not installed"
  return 1
fi
}

if_install httpd
if [ $? -eq 0 ];then
  if pgrep httpd >/dev/null 2>&1;then
    echo "service httpd is started."
  else
    service httpd start >/dev/null 2>&1
    if pgrep httpd >/dev/null 2>&1;then
      echo "service htttpd start failed."
    fi
  fi
else
  yum install -y httpd >/dev/null 2>&1
  if pgrep httpd >/dev/null 2>&1;then
    echo "httpd installed & start successful."
  else
    service httpd start >/dev/null 2>&1
    if pgrep httpd >/dev/null 2>&1;then
      echo "httpd installed & start successful."
    else
      echo "httpd install failed."
    fi
  fi
fi

if_install mysql
if [ $? -eq 0 ];then
  if pgrep mysqled >/dev/null 2>&1;then
    echo "service mysqled is started."
  else
    service mysqled start >/dev/null 2>&1
    if pgrep mysqled >/dev/null 2>&1;then
      echo "service mysqled start failed."
    fi
  fi
else
#  yum install -y mysqled >/dev/null 2>&1
  if pgrep mysqled >/dev/null 2>&1;then
    echo "mysqled installed & start successful."
  else
    service httpd start >/dev/null 2>&1
    if pgrep mysqled >/dev/null 2>&1;then
      echo "mysqled installed & start successful."
    else
      echo "mysqled install failed."
    fi
  fi
fi
