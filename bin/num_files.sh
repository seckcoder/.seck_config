#!/bin/bash
# num_files: Count the number of certain type of files in a directory(Recursively)
E_ARGS=65
if [[ $# < 2 ]]
then
	echo "Usage: `basename "$0"` PATTERN FILE"
	exit $E_ARGS
fi

if ! [ -d "$2" ]
then
	echo "Param $2 is not a directory"
fi

count=0
i=1;
args=("$@")

while [ $i -lt $# ]
do
	((count = count + `ls -R ${args[$i]} | grep "$1" | wc -l`))
	((i=i+1))
done
echo $count


