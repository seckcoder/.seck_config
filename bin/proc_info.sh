#!/bin/sh
# output some process information

E_NOARGS=65
if [ -z "$1" ]
then
	echo "Usage: `basename "$1"` PROC_COMM_NAME"
fi

pid_list=`pgrep "$1"`

for pid in $pid_list
do
	echo "pid: $pid"
	echo "process command name: `readlink /proc/$pid/exe`"
	echo "process working directory: `readlink /proc/$pid/cwd`"
done

