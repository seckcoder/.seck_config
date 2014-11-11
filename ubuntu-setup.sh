#!/usr/bin/env bash
    

for soft in vim vim-gtk gcc g++ automake git gnome-system-tools
do
    sudo apt-get install $soft
done
