#!/usr/bin/env bash


pkg=$1
cd /usr/local/haskell
if [ -e $pkg ]
then
    echo "[ERROR]:$pkg already exist" >&2
    exit 1
else
    mkdir $pkg
    cd $pkg
    cabal sandbox init
    cabal install $pkg
fi
