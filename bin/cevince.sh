#!/bin/bash

if [ ! -d ~/.tmp ]; then
    mkdir -p ~/.tmp
fi
filename=${1##/*/}
cp "$1" ~/.tmp/
evince "$HOME/.tmp/$filename" &
