#!/bin/bash

PKG_NAME="mutt"
PACKAGE="$PKG_NAME-1.4.2.3"
TARBALL="$PACKAGE.tar.gz"
URL="ftp://ftp.mutt.org/mutt/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure
common_make

# don't setuid dotlock to mail -- we probably aren't building as root
# so the install to fail unless we fix this
perl -pi -e's|chmod 2755|chmod 755|' Makefile
perl -pi -e"s|chgrp mail|chgrp `id -g`|" Makefile


common_install
common_install_links
