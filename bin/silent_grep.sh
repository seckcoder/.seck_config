#!/bin/bash
# silent_grep.sh: Test whether a pattern exist in a file
E_ARGS=65
if [ $# -ne 2 ]
then
	echo "Usage: `basename "$0"` PATTERN FILE"
	exit E_ARGS
fi

grep -e $1 $2 -q
if [ $? -eq 0 ]
then
	echo "Pattern $1 Exist in File $2"
else
	echo "Pattern $1 Not Exist in File $2"
fi
