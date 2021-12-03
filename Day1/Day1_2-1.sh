#!/bin/bash
start=$(($(date +%s%N)/1000000))
acc=0
counter=1
prev=0
rows=$(wc -l input | cut -d' ' -f1)
for j in 1 2 3
do
	t=$(awk -v j=$j 'NR==j{print;exit}' input)
	let 'prev +=t'
done

while read i
do
	#sliding window
	if [[ $counter -gt $(($rows-2)) ]]
	then
		break
	fi
	one=$(head input -n $(($counter+1)) | tail -n 1)
	two=$(head input -n $(($counter+2)) | tail -n 1)
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
