#!/bin/bash

PKG_NAME="mplayer"
PACKAGE="$PKG_NAME-$(date '+%Y.%m.%d')"
PREREQS="subversion"

# source common envs
. ../../common.sh

export CONFIGURE="$CONFIGURE --enable-gui"
export CFLAGS="$CFLAGS -O1 -fomit-frame-pointer"
export CC=gcc

common_prereqs

rm -rf work

if [ ! -r "mplayer-src.tar.gz" ]
then
    echo
    echo "Checking out current svn source..."
    echo
    if [ -r mplayer-src ]; then
        echo "UPDATING..."
        cd mplayer-src || exit 1
        svn update || exit 1
        cd ..
    else
        echo "CHECKING OUT..."
        svn checkout svn://svn.mplayerhq.hu/mplayer/trunk mplayer-src || exit
    fi
    echo
    echo "Creating tarball from source..."
    echo
    find mplayer-src -name .svn > Exclude
    tar cvfzX mplayer-src.tar.gz Exclude mplayer-src
    echo
    echo DONE
    echo
fi

mkdir work || exit 1
cd work || exit 1

tar xvfz ../mplayer-src.tar.gz || exit 1

cd mplayer-src || exit 1

common_configure
common_make
common_install
common_install_links
