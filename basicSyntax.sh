#!/bin/bash

a=5

#for i in {$a..50};do
for (( i=$a; i<=50; i++)); do
	if (( i % 2 == 0 ));
	then
		echo "$i divisible of 2";
	else
		echo "$i not divisible by 2";
	fi
	

done
