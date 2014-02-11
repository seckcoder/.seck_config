#!/bin/sh
# convert input ascii string to hex

if [ -z "$1" ]
then
	echo "Usage: `basename $0 ` \"Input String\""
else
	echo -n "$1" | od -t x1
fi

