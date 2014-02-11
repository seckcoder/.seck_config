#!/bin/bash

tdir=${1:-`pwd`}

for file in `find $tdir`
do
    if [[ -f "$file"  || -h "$file" ]]
    then
        if [ -x "$file" ]
        then
            chmod -x "$file"
        fi
    fi
done
