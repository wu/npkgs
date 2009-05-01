#!/bin/bash

PKG_NAME="bitlbee"
PACKAGE="$PKG_NAME-1.2.3"
TARBALL="$PACKAGE.tar.gz"
URL="http://get.bitlbee.org/src/$TARBALL"

# source common envs
. ../../common.sh

export CC=gcc

CONFIGURE="$CONFIGURE --pidfile=$NPKG_PREFIX/var/run/bitlbee.pid \
                      --config=$NPKG_PREFIX/etc/bitlbee/config \
                      --ipcsocket=$NPKG_PREFIX/var/run/bitlbee.sock"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure
common_make
common_install

if [ ! -d $NPKG_PREFIX/var/run ]; then mkdir -p $NPKG_PREFIX/var/run; fi

if [ ! -d $NPKG_PREFIX/etc/bitlbee/config ]
then
    mkdir -p $NPKG_PREFIX/etc/bitlbee/config
    common_make install-etc || exit
fi

common_install_links
