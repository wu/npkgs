#!/bin/bash

PKG_NAME="tesseract"
PKG_VER="2.01"
PACKAGE="$PKG_NAME-$PKG_VER"
TARBALL="$PACKAGE.tar.gz"
URL="http://tesseract-ocr.googlecode.com/files/$TARBALL"

# source common envs
. ../../common.sh

export CC=gcc
export CXX=g++

common_fetch
common_prereqs
common_clean
common_untar

# build and install
cd $PACKAGE                           || exit

echo
echo
echo "APPLYING PATCHES from http://www.win.tue.nl/~aeb/linux/ocr/tesseract.html"
echo
$PATCHCMD dict/reduce.cpp       < ../../files/patch1 || exit
$PATCHCMD dict/dawg.cpp         < ../../files/patch2 || exit
$PATCHCMD classify/intproto.cpp < ../../files/patch3 || exit
$PATCHCMD image/imgs.cpp        < ../../files/patch5 || exit
$PATCHCMD display/pgedit.cpp    < ../../files/patch6 || exit
echo
echo

common_configure
common_make
common_install
common_install_links

if [ ! -r $NPKG_PREFIX/root/tesseract/share/tessdata/eng.unicharset ]
then
    echo
    echo "Installing english language tessdata files"
    cd ..
    wget http://tesseract-ocr.googlecode.com/files/tesseract-2.00.eng.tar.gz || exit
    tar xvfz tesseract-2.00.eng.tar.gz || exit
    cp tessdata/* $NPKG_PREFIX/root/tesseract/share/tessdata/ || exit
fi
