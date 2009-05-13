#!/bin/bash

PKG_NAME="apache"
PACKAGE="httpd-2.2.11"
TARBALL="$PACKAGE.tar.gz"
URL="http://archive.apache.org/dist/httpd/$TARBALL"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --enable-mods-shared=all --enable-cgid \
                      --enable-dav-fs --enable-dav --enable-deflate \
                      --enable-expires --disable-userdir --enable-rewrite \
                      --enable-proxy --enable-nonportable-atomics \
                      --with-included-apr --enable-cgi \
                      --with-mpm=worker --with-ssl=$PREFIX/root/openssl "


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
