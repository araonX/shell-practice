#!/bin/bash
sql_cmd="/usr/local/mysql/bin/mysql -uroot -pmysql"
if ! $sql_cmd -e "show processlist" >/dev/null 2>/dev/null
then
  echo "mysql service is not run."
  exit 
else
  $sql_cmd -e "show slave status\G" 2>/dev/null >/tmp/slave.stat
  n=`wc -l /tmp/slave.stat | awk '{print $1}'`
  if [ $n -eq 0 ];then
    echo "This is master."
  else
    echo "This is slave."
    egrep 'Slave_IO_Running:|Slave_SQL_Running:' | awk -F':''{print $2}' >/tmp/sql.stat
    if grep -qw "No" /tmp/sql.stat;then
      echo " The slave is down."
    fi
  fi
fi

