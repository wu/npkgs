#!/bin/bash

PKG_NAME="erlang"
PACKAGE="otp_src_R13B01"
TARBALL="$PACKAGE.tar.gz"
URL="http://erlang.org/download/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                     || exit

common_configure
common_make
common_install

common_install_links
