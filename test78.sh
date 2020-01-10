#!/bin/bash
blog=$(basename $0)
filename=/var/lock/subsys/$blog
read -p "Please input your choice(start|stop|restart|status):" option
	while [ "$option" != "start" -a "$option" != "stop"  -a "$option" != "restart" -a "$option" != "status" ];do
		echo "Wrong option."
		echo "Usage:input start|stop|restart|status"
		exit 0
	done
case $option in 
    start)
	[ -e $filename ] && echo "service is running." && exit 0
 	touch $filename && echo "service start success."
	exit 0	
	;;
    stop)
	[ ! -e $filename ] && echo "service is stopped." && exit 0
	rm -f $filename && echo "service stop success."
	exit 0
	;;
    restart)
	[ -e $filename ] && rm -f $filename  &&  touch $filename && echo "stop & start success;restart success." && exit 0
	[ ! -e $filename ] && touch $filename && echo "start service successful; service restart success." && exit 0
	;;
    status)
	echo "status"
	;;
    *)
	exit 2
esac
