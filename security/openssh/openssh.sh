#!/bin/bash

PKG_NAME="openssh"
PACKAGE="$PKG_NAME-5.4p1"
TARBALL="$PACKAGE.tar.gz"
URL="http://mirror.planetunix.net/pub/OpenBSD/OpenSSH/portable/$TARBALL"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-prngd-socket=$PREFIX/var/run/egd-pool --with-privsep-path=$PREFIX/var/empty"

common_fetch
common_prereqs
common_clean
common_untar

cd $PACKAGE                          || exit

common_configure
common_make
common_install
common_install
common_install_links
