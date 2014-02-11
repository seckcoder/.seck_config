#!/bin/bash
#=============================================================================
#     FileName: rename_images.sh
#         Desc: rename_images [DIR]
# 				rename all the images with the common image format in the specified directory
#               
#       Author: seckcoder
#        Email: seckcoder@gmail.com
#     HomePage: NULL
#      Version: 0.0.1
#   LastChange: 2011-10-18 21:26:16
#      History:
#=============================================================================

ROOT_UID=0
E_NOOTROOT=87

if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "The script must be run as root"
	exit $E_NOOTROOT 
fi

#if [ -n "$1" ]
#then
	#dir="$1";
#else
	#dir=`pwd`;
#fi

dir=${1:-`pwd`}

typelist=("jpeg" "jpg" "gif" "png" "JPEG" "JPG" "GIF" "PNG")
j=0;
for i in `ls $dir`
do
	filename=${i%%.*};
	filetype=${i##*.};
	for m_type in ${typelist[@]}
	do
		if [ "$filetype" == "$m_type" ]
		then
			mv "$dir"/"$i" "$dir"/"$j"."$filetype";
			j=$((j+1));
			break;
		fi
	done
done



exit 0
