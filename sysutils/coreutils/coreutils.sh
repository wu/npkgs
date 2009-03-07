#!/bin/bash

PKG_NAME="coreutils"
PACKAGE="$PKG_NAME-7.1"
TARBALL="$PACKAGE.tar.gz"
URL="http://ftp.gnu.org/pub/gnu/coreutils/$TARBALL"
PREREQ="patch"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --with-libiconv-prefix=$PREFIX/root/libiconv"

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                          || exit

common_configure

# hmm, weird, on my new OS X laptop, for some reason it's thinking i
# have BeOS (i.e. appears to be thinking i have OS.h?).  I do have an
# os.h in /usr/local/include that comes from apache.  perhaps this is
# the problem since the fs is case insensitive?
perl -pi -e's|HAVE_OS_H 1|HAVE_OS_H 0|' lib/config.h

common_make
common_install
common_install_links
