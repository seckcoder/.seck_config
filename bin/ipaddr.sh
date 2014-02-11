#!/bin/bash
# ipaddr.sh: return the ip address of the specified network interface
E_NOARGS=65
if [ -z "$1" ] 
then
	echo "Parameter Null Error"
	echo 
	echo "Usage: `basename $0` INTERFACE"

	exit $E_NOARGS
fi

ifconfig $1 | egrep -o "inet addr:[^ ]*" | grep -o "[0-9.]*"
