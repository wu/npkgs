# common env vars for build scripts

# where npkg lives
if [ -z "$NPKG_PATH" ]; then
    echo "USING DEFAULT NPKG_PATH: /usr/local/npkg, override with NPKG_PATH env var"
    export NPKG_PATH="/usr/local/npkg";

    if [ ! -r "$NPKG_PATH/common.sh" ]; then
      echo "ERROR: Can't find $NPKG_PATH/common.sh!"
      echo "Please export NPKG_PATH to the directory where npkg's common.sh lives"
      exit;
    fi
fi

# where to install stuff
if [ ! -z "$NPKG_PREFIX" ]; then
    echo "INSTALLING INTO SPECIFIED NPKG_PREFIX: $NPKG_PREFIX"
    export PREFIX="$NPKG_PREFIX";
fi
if [ -z $PREFIX ]; then
    echo "INSTALLING INTO DEFAULT PREFIX: /usr/local, override with NPKG_PREFIX env var"
    export PREFIX="/usr/local"
fi
if [ ! -d $PREFIX ]; then
  mkdir $PREFIX || exit 1
fi

# operating system overrides
OS=`uname -s`
OSVER=`uname -r`

# operating system defaults
echo "CHECKING FOR: $NPKG_PATH/common/os/$OS/default.sh"
if [ -r "$NPKG_PATH/common/os/$OS/default.sh" ]; then
  . "$NPKG_PATH/common/os/$OS/default.sh"
fi

# specific version of an os overrides defaults
echo "CHECKING FOR: $NPKG_PATH/common/os/$OS/$OSVER.sh"
if [ -r "$NPKG_PATH/common/os/$OS/$OSVER.sh" ]; then
  . "$NPKG_PATH/common/os/$OS/$OSVER.sh"
fi

# hostname specific overrides
HOST_SHORT=${HOST%%.*}
echo "CHECKING FOR: $NPKG_PATH/common/host/$HOST_SHORT.sh"
if [ -r "$NPKG_PATH/common/host/$HOST_SHORT.sh" ]; then
  . "$NPKG_PATH/common/host/$HOST_SHORT.sh"
fi


echo
echo
echo "BUILD PATH: $PATH"
echo
echo

# xterm-256color will cause the tests for some packages to fail
if [ "$TERM" = "xterm-256color" ]; then
    export TERM=xterm
fi

# where to install a specific package
if [ -z "$PKG_PREFIX" ]; then
    export PKG_PREFIX="$PREFIX/root/$PACKAGE"
fi

echo
echo "INSTALLING INTO: $PKG_PREFIX..."
echo
sleep 1;
    
# pkgconfig
if [ -z "$PKG_CONFIG_PATH" ]; then
    export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
fi

# programs
if [ -z "$TAR" -a -r "$PREFIX/bin/tar" ]
then
    export TAR="$PREFIX/bin/tar"
else
    export TAR="/usr/bin/tar"
fi

if [ -z "$WGET" -a -r "$PREFIX/bin/wget" ]
then
    export WGET="$PREFIX/bin/wget"
fi

if [ -z "$MAKE" ]; then
    export MAKE="make"
fi

if [ -z "$GMAKE" ]; then
    export GMAKE="gmake"
fi

if [ -z "$CC" ]; then
    export CC="gcc"
fi

if [ -z "$CXX" ]; then
    export CXX='g++'
fi

if [ -z "$CONFIGURE" ]; then
    CONFIGURE="./configure --prefix=$PKG_PREFIX"
fi

if [ -z "$PERL" -a -r "$PREFIX/bin/perl" ]; then
    PERL=$PREFIX/bin/perl
fi

if [ -z "$DISTFILES" ]; then
  export DISTFILES="$PREFIX/distfiles"
fi

if [ ! -d $DISTFILES ]; then
  mkdir $DISTFILES || exit 1
fi

# build options
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"
export CPPFLAGS="-I$PREFIX/include $CPPFLAGS"
export CFLAGS="-I$PREFIX/include $CFLAGS"
export CXXFLAGS="-I$PREFIX/include $CXXFLAGS"

# add ncurses directory to include path if it exist
if [ -d $PREFIX/include/ncurses ]; then
    export CPPFLAGS="-I$PREFIX/include/ncurses $CPPFLAGS"
fi


export LD_RUN_PATH=$PREFIX