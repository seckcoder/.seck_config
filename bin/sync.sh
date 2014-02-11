#! /bin/sh
# sync.sh : sync in / out linux configuation file
cur_dir=`pwd`
usage()
{
	echo "Error Message: $1"
	echo "Usage: `basename $0 [options]`"
	echo "options:"
	echo "-i 	: synchronize in(from removable device to current computer disk; default is in reverse direction"
	echo "-h 	: display help message"
}

sync_in=0
while [ $# -ne 0 ]
do
	case "$1" in
		"-i" 	) shift; sync_in=1;;
	"-h"    ) usage; exit 0;;
esac
done

copy_file_list=(.vimrc .msmtprc .procmailrc .fetchmailrc .bashrc .signature .mutt .lftp Mail CurrentSettings.speeddial)
src_dir="$HOMEj"
dst_dir="$HOME"
if (( sync_in ))
then
	src_dir="$HOME/link/linuxbackup"
	dst_dir="$HOME"
	cp -ruv --no-preserve=mode,ownership -t /home/seckcoder/bin $src_dir/bin/*
else
	src_dir="$HOME"
	dst_dir="$HOME/link/linuxbackup"
fi
if cd $src_dir
then
	for i in ${copy_file_list[@]}
	do
		if [ -e "$i" ]
		then cp -ruv --no-preserve=mode,ownership -t "$dst_dir" "$i"
		fi
	done
	if [ -d .vim ]
	then
		if ! [ -d "$dst_dir/.vim" ]
		then
			mkdir -p "$dst_dir/.vim"
		fi
		vim_plugin_list=`ls .vim | grep -e "[^tags]" | sed "s/\w\+/.vim\/&/"`
		for i in ${vim_plugin_list[@]}
		do
			echo $i
			cp -ruv --no-preserve=mode,ownership -t "$dst_dir/.vim" "$i"
		done
	fi
	cd "$cur_dir"
fi
