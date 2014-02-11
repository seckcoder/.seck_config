#!/bin/bash
# HWaddr.sh: return the mac address
E_NOARGS=65
if [ -z "$1" ] 
then
	echo "Parameter Null Error"
	echo 
	echo "Usage: `basename $0` INTERFACE"
	exit $E_NOARGS
fi

ifconfig eth0 | egrep -o "HWaddr [^ ]*" | egrep -o "[0-9A-Z]{2}:[0-9A-Z]{2}:[0-9A-Z]{2}:[0-9A-Z]{2}:[0-9A-Z]{2}:[0-9A-Z]{2}"
