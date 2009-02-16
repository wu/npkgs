#!/bin/bash

PKG_NAME="apache"
PACKAGE="httpd-2.2.11"
TARBALL="$PACKAGE.tar.gz"
URL="http://archive.apache.org/dist/httpd/$TARBALL"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --enable-cgid --enable-dav-fs --enable-dav \
                      --enable-deflate --enable-expires --disable-userdir \
                      --enable-rewrite --enable-headers \
                      --enable-proxy --disable-ipv6"

# --enable-ssl --with-ssl=$PREFIX

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                           || exit

common_configure
common_make
common_install
common_install_links

