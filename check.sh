#!/bin/sh
for i in $( cat iplist )
do
	ping -q -c2 $i > /dev/null
	if [ $? -eq 0 ]
	then
		echo $i "Pingable"
	else
		echo $i "Not Pingable"
	fi
done
