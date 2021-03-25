#!/bin/bash

p3=$(python3 -V 2>&1)
p2=$(python2 -V 2>&1)

echo "Enter your P-command"; read p

if [[ $($p -V) == $p3 ]]; then
	echo "Nice, you are using $p3. Want to continue?[y/n]"
	read answer
	if [[ $answer == "y" ]]; then
		$p
	else
		echo "Bye"
	fi
elif [[ $($p -V 2>&1) == $p2 ]]; then
	echo "This is older version. Recomended to use python3"
else
	echo "wrong command"
fi
