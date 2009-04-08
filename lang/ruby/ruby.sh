#!/bin/bash

PKG_NAME="ruby"
PACKAGE="${PKG_NAME}-1.9.1-p0"
TARBALL="$PACKAGE.tar.gz"
URL="ftp://ftp.ruby-lang.org/pub/ruby/1.9/$TARBALL"

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
