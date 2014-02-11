# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

#if ( -f /bin/zsh ) exec /bin/zsh

unset PYTHONPATH   # I don't know when I set this...
export EDITOR=/usr/local/vim/bin/vim
test -s ~/.alias && . ~/.alias || true

alias "c=xclip"
alias "v=xclip -o"
alias "cb=xclip -selection clipboard"

export VIMDIR="/usr/local/vim"
export PATH="$PATH:$VIMDIR/bin"

export EMACSDIR="/usr/local/emacs"
export PATH="$PATH:$EMACSDIR/bin"

set -o vi

export XIM=fcitx
export XIM_PORGRAM=/usr/bin/fcitx
export XIM_ARGS=""
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS="@im=fcitx"


export MSMTPDIR="/usr/local/msmtp"
export PATH="$PATH:$MSMTPDIR/bin"


MAIL=/var/spool/mail/seckcoder && export MAIL

CODE=~/code && export CODE

export PATH="$PATH:$HOME/bin"

export BOOST_ROOT=/usr/local/boost
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$BOOST_ROOT/lib"

export CMAKEDIR=/usr/local/cmake/cmake-2.8.8
export PATH="$PATH:$CMAKEDIR/bin"

export PATH="$PATH:/usr/local/thunderbird"

#python
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib"

#thrift
export THRIFTDIR=/usr/local/thrift
export PATH="$PATH:$THRIFTDIR/bin"

#cuda
export CUDADIR=/usr/local/cuda
export PATH="$PATH:$CUDADIR/bin"

#mpich2
export MPICH2dir=/usr/local/mpich2
export PATH="$PATH:$MPICH2dir/bin"

#jdk
export JAVA_HOME=/usr/local/jdk/jdk1.7.0_04
export PATH="$PATH:$JAVA_HOME/bin"
export CLASSPATH="$CLASSPATH:$JAVA_HOME/lib"


alias ymake="./devel/ymake/ymake.sh"
#alias run_server=".ymake-out/dbg/app_search/mobile_backend/cpp/mobile_backend_server"
#alias run_client=".ymake-out/dbg/app_search/mobile_backend/cpp/mobile_backend_sample_client"
#alias run_test=".ymake-out/dbg/app_search/mobile_backend/cpp/mobile_backend_service_unittest"
#alias run_cpp_test=".ymake-out/dbg/other-test/cpp-test/cpp-test"

export WATERARMY=/home/liwei/code/jike/Govel/water_army
export GOVEL=~/code/jike/Govel
export KIKYO=~/code/jike/kikyo
export WTX=~/code/jike/wtx
export WTXJS=$WTX/frontend/weibo/snsManage/public/js/mobile/snsm
export NEWS=~/code/jike/news-dev
export NEWS_CLASSIFY=~/code/jike/news-dev/news_search/page_analysis/topicclassify
export EVALUATION=~/code/jike/wtx/mobile/wtx/evaluation

#go
export GODIR=/home/liwei/go
export PATH="$PATH:$GODIR/bin"

#tesseract
export TESSDATA_PREFIX=/usr/local/share/

#hadoop
export HADOOP_INSTALL=/usr/local/hadoop/hadoop-0.20.2
export PATH="$PATH:$HADOOP_INSTALL/bin"
export PLATFORM=Linux-amd64-64

#homebrew
#export HOMEBREW_INSTALL=/opt/homebrew
#export PATH="$PATH:$HOMEBREW_INSTALL/bin"


#ruby
export RUBYOPT=rubygems

export PKUVOLUME=~/code/pkuVolume


#apache
export APACHEDIR="/usr/local/apache"
export APACHE_CONF_DIR="$APACHEDIR/conf"
export PATH="$PATH:$APACHEDIR/bin"


#node
export NODEDIR="/usr/local/node"
export PATH="$PATH:$NODEDIR/bin"
export NODE_PATH="$NODEDIR/lib/node_modules"


export VIMCLOJURE_SERVER_JAR="$HOME/jar/server-2.3.6.jar"


#qp
export QP=~/code/jike/tt/qiangpiao

#nginx
export NGINX=/usr/local/nginx
export PATH="$PATH:$NGINX/sbin"


#gcc
#GCC_4_4_3=/opt/gcc-4.4.3
#export PATH="$GCC_4_4_3/bin:$PATH"


# debug celery
#export PYTHONPATH=~/code/pub_repo/celery
#set PYTHONDONTWRITEBYTECODE

# openvpn
export OPENVPNDIR="/usr/local/openvpn"
export PATH="$PATH:$OPENVPNDIR/sbin:$OPENVPNDIR/easy-rsa"


# erlang
export ERLANGDIR="/usr/local/otp"
export PATH="$PATH:$ERLANGDIR/bin"


# CPP DEMO
export CPPDEMO="$WTX/demo"


# RUST
export RUSTDIR="/usr/local/rust/rust-0.6"
export PATH="$PATH:$RUSTDIR/bin"

# python
# source /usr/local/py_env/global/bin/activate

# racket
export RACKETDIR="/usr/local/racket-5.3.5/"
export PATH="$PATH:$RACKETDIR/bin"


# lighttable
export LIGHTTABLE="~/LightTable"
export PATH="$PATH:$LIGHTTABLE"

# petite chez scheme
export CHEZ_SCHEME="/usr/local/chez-scheme"
export PATH="$PATH:$CHEZ_SCHEME/bin"
export SCHEMEHEAPDIRS="$CHEZ_SCHEME/lib/csv8.4/ta6le"

# mit scheme
export MIT_SCHEME="/usr/local/mit-scheme"
export PATH="$PATH:$MIT_SCHEME/bin"
