#!/bin/bash

PKG_NAME="subversion"
PACKAGE="$PKG_NAME-1.7.5"
TARBALL="$PACKAGE.tar.bz2"
URL="http://mirror.atlanticmetro.net/apache/subversion/$TARBALL"
PREREQS="swig neon libiconv apache"

# source common envs
. ../../common.sh

CONFIGURE="$CONFIGURE --disable-berkeley-db                            \
                      --with-neon=$PREFIX/root/neon                    \
                      --with-swig=$PREFIX/root/swig                    \
                      --with-apr=$PREFIX/root/apache/bin/apr-1-config  \
                      --without-sasl                                   \
                      --with-ssl=$PREFIX/root/openssl                  \
                      --with-apxs=$PREFIX/root/apache/bin/apxs         \
                      "

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd $PACKAGE                           || exit

common_configure
common_make
common_install

echo
echo INSTALLING PERL BINDINGS
echo
make swig-pl || exit
make check-swig-pl || exit
make install-swig-pl || exit

echo
echo
common_install_links
