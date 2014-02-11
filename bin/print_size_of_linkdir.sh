#!/bin/sh
# Print the sumed size of the directory that contains links
E_NOARGS=65
if [ -z "$1" ]
then
	echo "Usage: `basename "$0"` Directory"
	exit $E_NOARGS
fi

E_NONDIR=66

if ! [ -d "$1" ]
then
	echo "\""$1"\" is not a directory or non-accessible"
	exit $E_NONDIR
fi
du -shL "$1"



