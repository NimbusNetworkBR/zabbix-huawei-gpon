#!/bin/bash
#$1 IP $2 Comunidade $3 PORTA $4 STATUS
#UserParameter=olt.status[*],/opt/scripts/olt.sh $1 $2 $3 $4


case "$4" in
	1)
		echo $(snmpwalk -v2c -c $2 $1 .1.3.6.1.4.1.2011.6.128.1.1.2.46.1.15.${3} | cut -d= -f2 | grep "2" | uniq -c | cut -c1-7 | sed 's/ //g')
		;;
	2)
		echo $(snmpwalk -v2c -c $2 $1 .1.3.6.1.4.1.2011.6.128.1.1.2.46.1.15.${3} | cut -d= -f2 | grep "1" | uniq -c | cut -c1-7 | sed 's/ //g')
		;;
	*)
		exit 1
esac
