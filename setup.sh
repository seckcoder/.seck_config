#!/usr/bin/env bash

os=`uname`
env=".seck_config"

cd ..

if [ $os = "linux" ]
then
    ln -Fs $env/.bashrc
elif [ $os = 'Darwin' ]
then
    ln -Fs $env/.bashrc $env/.bash_profile
fi

for f in .vimrc .vim .emacs.d bin .ocamlinit .pythonrc .gitconfig .guile \
    .gvimrc .racketrc .csirc
do
    ln -Fs $env/$f
done

    

#ln -Fs $env/.vimrc $env/.vim $env/.emacs.d $env/bin\
    #$env/.ocamlinit $env/.pythonrc $env/.gitconfig $env/.guile\
    #$env/.gvimrc $env/.racketrc $env/.csirc
