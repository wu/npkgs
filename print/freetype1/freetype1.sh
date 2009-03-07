#!/bin/bash

PKG_NAME="freetype1"
PACKAGE="freetype-1.3.1"
TARBALL="$PACKAGE.tar.gz"
URL="http://voxel.dl.sourceforge.net/sourceforge/freetype/$TARBALL"

MAKE=gmake
CC=gcc

# source common envs
. ../../common.sh

common_prereqs
common_clean

# create the 'work' directory and set into it
mkdir work || exit
cd work/ || exit

# checking out freetype
cvs -z3 -d:pserver:anonymous@cvs.savannah.nongnu.org:/sources/freetype co freetype || exit

# build and install
cd freetype                   || exit

# make configure script executable
chmod a+x configure mkinstalldirs

common_configure
common_make
common_install
common_install_links
