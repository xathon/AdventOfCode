#!/bin/bash
count=0

prev=$(head input -n 1)
while read i
do
	if [[ $i -gt $prev ]]
	then
		let 'count++'
	fi
	prev=$i
done < input
echo $count
