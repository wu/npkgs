#!/bin/bash

PACKAGE="perl-5.10.0"
TARBALL="$PACKAGE.tar.gz"
URL="http://www.perl.com/CPAN/src/$TARBALL"

# source common envs
. ../../common.sh

# prep
unset PERL5LIB

common_fetch
common_prereqs
common_clean
common_untar

# check if we already have a config.sh for this host
config_sh="../files/config.sh.$HOST_SHORT"
echo "SEARCHING FOR: $config_sh"

if [ -r $config_sh ]; then

  echo "FOUND!  Proceeding with quick build"
  CONFIGURE="sh Configure -Dprefix=$PKG_PREFIX -d"
  cp $config_sh $PACKAGE/ || exit

else

  echo "NOT FOUND!  Proceeding with interactive build"
  CONFIGURE="sh Configure -Dprefix=$PKG_PREFIX -Dldflags=-L$PREFIX/lib -Duseithreads -Dusethreads"
fi


# build and install
cd $PACKAGE                          || exit

common_configure
common_make
common_test
common_install
common_install_links

