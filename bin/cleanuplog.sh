#!/bin/sh
#=============================================================================
#     FileName: cleanuplog.sh
#         Desc: cleanuplog [NUM]
# 				clean up messages and wtmp in /var/log. When num specified,
# 				num lines of messages will be rested.
#       Author: seckcoder
#        Email: seckcoder@gmail.com
#     HomePage: NULL
#      Version: 0.0.1
#   LastChange: 2011-10-19 17:48:10
#      History:
#=============================================================================

LOG_DIR=/var/log
ROOT_UID=0
LINES=50
E_XCD=86
E_NOOTROOT=87

if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "Must be root to run the script"
	exit $E_NOOTROOT 
fi


#lines=${1:-$LINES}
E_WRONGARGS=85

case "$1"    in
	"" 		 ) lines=50;;
	*[!0-9]* ) echo "Usage: `basename $0` num lines not to clean"; exit $E_WRONGARGS;;
	*   	 ) lines=$1;;
esac

cd $LOG_DIR || {
	echo "Can't change to directory $LOG_DIR" > $2
	exit $E_XCD;
}

tail -n $lines messages > mesg.tmp
mv mesg.tmp messages

cat /dev/null > wtmp

echo "Log files cleaned up"

exit 0


