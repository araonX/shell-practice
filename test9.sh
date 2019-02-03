#!/bin/bash
log_f=/data/log/access.log
while true
do
502_n=`tail -n 100 | grep -c ' 502 '`
if [ -z "$502_n" ];then
  exit
fi
if [ "$502_n" -gt "100" ];then
  /etc/init.d/php-fpm restart >/dev/null 2>/tmp/php-fpm.err
  fpm_n=`pgrep -l php-fpm | wc -l`
  if [ "$fpm_n" -eq "0" ];then
    python mail.py xxx@xx.com "php-fpm重启失败" "`head -1 /tmp/php-fpm.err`"
    exit
  fi
fi
sleep 10
done
