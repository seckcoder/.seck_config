#!/bin/bash
#=============================================================================
#     FileName: fileinfo.sh
#         Desc: fileinfo filename [many]
#               Print file infomation
#       Author: seckcoder
#        Email: seckcoder@gmail.com
#     HomePage: NULL
#      Version: 0.0.1
#   LastChange: 2011-10-18 20:03:54
#      History:
#=============================================================================
file=$1;
file=${file:-.}
filepath=${file%/*.*}
filepath=${filepath:-.}
filename=${file##/*/}
filetype=${file##*.}
filetype=${filetype:-.}
echo "file:     ${file}"
echo "filepath: ${filepath}"
echo "filename: ${filename}"
echo "filetype: ${filetype}"
