#!/usr/bin/bash

#
# INFO:
#
# this is the 'common build environment' which includes pkgbuild and all
# tools required to run Sun's GNOME based desktop.
#

#
# SEE:
#  http://www.opensolaris.org/os/project/jds/contributing/building/
#  http://pkgbuild.sourceforge.net/spec-files-extra/
#

PKG_NAME="desktop-cbe"
PACKAGE="$PKG_NAME-1.7.0-rc1"
TARBALL="$PACKAGE-x86.tar.bz2"
URL="http://dlc.sun.com/osol/jds/downloads/cbe/test/$TARBALL"

# source common envs
. ../../common.sh

common_fetch
common_prereqs
common_clean
common_untar_bzip

# build and install
cd $PACKAGE || exit

#echo
#echo
#echo "%_topdir    /usr/local/cbe" > /root/.pkgbuildmacros

./cbe-install || exit

