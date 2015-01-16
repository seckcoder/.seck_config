#!/usr/bin/env bash


pkg=$1
cd /usr/local/haskell

if [ -e $pkg ]
then
  cd ./bin
  for pkg_bin in `ls ../$pkg/.cabal-sandbox/bin/`
  do
    if [ -e $pkg_bin ]
    then
      echo "unlink $pkg_bin"
      rm $pkg_bin
    fi
  done
  cd ..
  rm -rf $pkg
fi
