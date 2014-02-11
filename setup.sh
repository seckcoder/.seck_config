#!/usr/bin/env bash

os=`uname`
env=".seck_config"

cd ..

if [ $os = "Linux" ]
then
    ln -Fs $env/.bashrc
elif [ $os = 'Darwin' ]
then
    ln -Fs $env/.bashrc $env/.bash_profile
fi

for f in .vimrc .vim .emacs.d bin .ocamlinit .pythonrc .gitconfig .guile \
    .gvimrc .racketrc .csirc
do
#ln -Fs $env/$f
echo "hello"
done

cd $env

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

url="git://github.com"
github_repos=('mitsuhiko/vim-jinja' \
'majutsushi/tagbar' \
'scrooloose/nerdcommenter' \
'scrooloose/nerdtree' \
'guns/vim-clojure-static' \
'kien/rainbow_parentheses.vim' \
'tomtom/tlib_vim' \
'MarcWeber/vim-addon-mw-utils' \
'garbas/vim-snipmate' \
'honza/vim-snippets' \
'hylang/vim-hy' \
'ehamberg/vim-cute-python' \
'Shougo/neocomplete.vim' \
'Shougo/vimshell.vim' \
'Shougo/vimproc.vim' \
'seckcoder/vim-seckcoder' \
'scrooloose/syntastic' \
'OCamlPro/ocp-indent' \
'ervandew/supertab' \
'def-lkb/ocp-indent-vim' \
'sukima/xmledit' \
'vim-scripts/L9' \
'vim-scripts/FuzzyFinder' \
'vim-scripts/cscope.vim' \
'vim-scripts/a.vim' \
'vim-scripts/omlet.vim' \
'lunaru/vim-less' \
'wlangstroth/vim-racket');

other_repos=('git://git.wincent.com/command-t.git');

cd .vim/bundle

for repo in ${github_repos[@]}
do
    new_url=$url/$repo
    git clone $new_url
done

for repo in ${other_repos[@]}
do
    url=$repo
    git clone $url
done
