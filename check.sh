#!/bin/sh

[ -f ip ] || touch ip

for i in $( cat iplist )
do
	ping -q -c2 $i > /dev/null
	if [ $? -eq 0 ]
	then
		echo $i >> ip
	fi
done

#cat ip > sort > uniq >> ip
