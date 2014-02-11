#! /bin/sh
# copy file from one directory to another directory

cur_dir=`pwd`
src_dir=${1:-$cur_dir}
dst_dir=${2:-$cur_dir}
cd $src_dir

tar cf - . | (cd $dst_dir && tar xpvf - .)
