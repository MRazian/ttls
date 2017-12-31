#!/bin/sh

#backup then remove



##############Ping Swip!################################
path=results
#rm -rf $path
mkdir -p $path

day=$(date | awk '{print 2017"-"$2"-"$3}')
time=$(date | awk '{print $4}')
row="$day $time "
for i in $( cat ip )
do
	pingOutput=$(ping -q -c2 $i)
	if [ $? -eq 0 ]
	then
		echo "$i pingable"
	        touch $path/$i
		date >> $path/$i
		echo "$pingOutput" | grep avg >> $path/$i

		###aggregated Data
		pResult=$(echo "$pingOutput" | grep avg | awk -F'=' '{print $2}' | awk -F'/' '{print $2}')
		row="$row $pResult"
	else
		echo "$i error"
	fi
done

 
#data prepartion phase
echo $row >> $path/aggData

#draw plot after each inspection
./plot > p1.png
eog p1.png
