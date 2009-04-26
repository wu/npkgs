#!/bin/bash

PKG_NAME="ncurses"
PACKAGE="$PKG_NAME-5.7"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/pub/gnu/ncurses/$TARBALL"
PREREQS="make"

export MAKE=gmake
export CC=gcc
export CXX=g++

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --disable-overwrite --with-shared --disable-rpath --without-debug \
                      --with-ada --enable-safe-sprintf --enable-sigwinch"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure
common_make

# not running as root, see INSTALL
echo
echo RUNNING progs/capconvert
echo
cd progs || exit
./capconvert || exit
cd ..

common_install
common_install_links
