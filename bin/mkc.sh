#!/bin/bash
# mkc.sh: create a class 
capitalize_foremost()
{
	string="$1"
	foremostchar=${string:0:$2}
	rest=${string:$2}
	FOREMOSTCHAR=`echo $foremostchar | tr '[:lower:]' '[:upper:]'`
	echo "$FOREMOSTCHAR$rest"
}
usage()
{
	echo "$1"
	echo "Usage : `basename $0` [option] CLASSNAME"
	echo "Option:"
	echo "-u number:  make the foremost number of character to upper case"
	echo "-h 	   :  display help message"
}
is_file_exist()
{
	local f="$1"
	[[ -f "$f.h" || -f "$f.cpp" ]] && return 0 || return 1
}
msg_noargs="No Class Name Gived"
[[ $# -eq 0 ]] && usage "$msg_noargs" && exit 1

uppernumber=1
filename="test"
while [ $# -ne 0 ]
do
	case "$1" in
		"-u" 	) shift; uppernumber=$1; shift;;
		"-h" 	) usage; exit 0;;
			*   ) filename="$1"; shift;;
	esac
done
msg_class_exist="Class Exist"
if ( is_file_exist "$filename" )
then
	usage "$msg_class_exist"
fi
touch "$filename.h" "$filename.cpp"
uppername=`echo "$filename" | tr '[:lower:]' '[:upper:]'`
classname=C`capitalize_foremost "$filename" $uppernumber`
echo -e "#ifndef _"$uppername"_H\n#define _"$uppername"_H\n\nclass "$classname" {\npublic:\n\t"$classname"();\n\t~"$classname"();\n\n};\n#endif  // _"$uppername"_H" > "$filename.h"
echo -e "#include \""$filename.h"\"\n\n\n"$classname"::"$classname"(){}\n"$classname"::~"$classname"(){}\n" > "$filename.cpp"

