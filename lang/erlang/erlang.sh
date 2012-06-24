#!/bin/bash

PKG_NAME="erlang"
PKG_VERSION="R15B01"
PACKAGE="$PKG_NAME-$PKG_VERSION"
TARBALL="otp_src_$PKG_VERSION.tar.gz"
URL="http://erlang.org/download/$TARBALL"

export CC=gcc
export MAKE=gmake

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar
# build and install
cd otp_src_$PKG_VERSION                     || exit

export LANG=C

export CONFIGURE="$CONFIGURE --with-ssl=$NPKG_PREFIX/root/openssl-1.0.0d"

# add erlang's own pcre ahead of any others
export CFLAGS="-I$PWD/erts/emulator/pcre $CFLAGS "
export CPPFLAGS="-I$PWD/erts/emulator/pcre $CPPFLAGS "
export CXXFLAGS="-I$PWD/erts/emulator/pcre $CXXFLAGS "

 CONFIGURE="$CONFIGURE \
    --disable-debug \
    --enable-kernel-poll \
    --enable-threads \
    --enable-dynamic-ssl-lib  \
    --enable-shared-zlib \
    --enable-smp-support"

#    --with-dynamic-trace=dtrace

common_configure
common_make

echo "installing..."
common_install
echo "...done installing"

echo
echo
echo "Symlink-ing to: $NPKG_PREFIX/bin/erl"
ln -s $PKG_PREFIX/bin/erl $NPKG_PREFIX/bin/erl


# common_install_links

