#!/bin/bash

PKG_NAME="openssl"
PACKAGE="$PKG_NAME-0.9.8l"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.openssl.org/source/$TARBALL"
PREREQS="make"

export MAKE=gmake

# source common envs
. ../../common.sh

CONFIGURE="./Configure shared --prefix=$PKG_PREFIX $OPENSSL_TARGET"

common_fetch
common_prereqs
common_clean
common_untar

cd $PACKAGE                          || exit

if [ -z "$OPENSSL_TARGET" ]; then
    echo
    echo "ERROR: OPENSSL_TARGET is not set in your environment"
    echo "RECOMMEND SETTING IT IN: $NPKG_PATH/common/host/$HOST_SHORT.sh"
    echo
fi


# remove the '-fast' option for solaris-x86-cc target, this will allow
# cross compiling for machines that don't support sse
#perl -pi -e's|\"solaris-x86-cc\",\"cc\:-fast |"solaris-x86-cc","cc:|g' Configure

common_configure
common_make
common_install
common_install
common_install_links
