#!/bin/bash
declare -i j=1
declare -i i=1
    while [ $j -le 9 ];do
	while [ $i -le $j ];do
		echo -n -e "$[i]*$[j]=$[$j*$i]\t"
		let i++
	done
	echo
	let i=1
	let j++
    done

		
