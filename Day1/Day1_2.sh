#!/bin/bash
start=$(($(date +%s%N)/1000000))
acc=0
counter=1
prev=0
for j in 1 2 3
do
	t=$(awk -v j=$j 'NR==j{print;exit}' input)
	let 'prev +=t'
done

while read i
do

	#sliding window
	one=$(awk -v c=$counter 'NR==c+1{print;exit}' input)
	two=$(awk -v c=$counter 'NR==c+2{print;exit}' input)
	if [[ $two -eq '' ]]
	then
		break
	fi
	sum=$i+$one+$two

	if [[ $sum -gt $prev ]]
	then
		let 'acc++'
	fi
	prev=$sum

	let 'counter++'
done < input
echo $acc
end=$(($(date +%s%N)/1000000))
echo 'Time='$((end-start))
