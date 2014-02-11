#!/bin/bash

option=$1
if [ -z $option ];
then
    echo "No options for gen specified"
    exit 64
fi

for fname in *.thrift
do
    thrift --gen $option $fname
done
