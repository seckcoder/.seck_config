#!/usr/bin/env bash

pkg=$1

cd /usr/local/haskell
if [ -e $pkg ]
then
    cd ./bin
    for new_bin in `ls ../$pkg/.cabal-sandbox/bin/`
    do
        if [ -e $new_bin ]
        then
            echo "[ERROR]: $new_bin already exit" >&2
            exit 1
        fi
    done
    for new_bin in `ls ../$pkg/.cabal-sandbox/bin/`
    do
        echo "Linking $new_bin ..."
        ln -s ../$pkg/.cabal-sandbox/bin/$new_bin
    done
else
    echo "[ERROR]:$pkg not exist. Please run hs.py install $pkg first." >&2
    exit 1
fi
