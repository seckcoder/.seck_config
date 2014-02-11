#!/bin/bash
# word_count.sh: Count the number of occurence of the word
E_ARGS=65
if [[ $# < 2 ]]
then
	echo $#
	echo "Usage: `basename "$0"` PATTERN FILE"
	exit $E_ARGS
fi

count=0
i=1;
args=("$@")
while [ $i -lt $# ]
do
	((count=count+`grep -o "$1" "${args[$i]}" | grep -c "$1"`))
	((i=i+1))
done
echo $count
