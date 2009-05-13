#!/bin/bash

PKG_NAME="sd"

DATE=`date '+%Y-%m-%d'`
PACKAGE="$PKG_NAME-$DATE"

URL="git://github.com/obra/sd.git"

# source common envs
. ../../common.sh

common_prereqs
common_clean

#common_fetch_git
mkdir work
cd work
git clone $URL

# build and install
cd $PKG_NAME                          || exit


#common_configure_perl
PERL_MM_USE_DEFAULT=1 perl Makefile.PL || exit

common_make
common_make_test
common_install
