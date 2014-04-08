#!/bin/sh
IFS=","
orders="1126,5553,2316"
for v in $orders; do
	echo "$v"
done
# seq=`perl -e "\$,=' ';print 2..$max"`
for v in `seq 1 3`; do echo $v; done
