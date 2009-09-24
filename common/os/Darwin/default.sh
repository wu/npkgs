# default path

export PATH="$PREFIX/bin:$PREFIX/sbin:/sw/bin:/sw/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"

export LDFLAGS="-L/usr/X11R6/lib $LDFLAGS"
export CPPFLAGS="-I/usr/X11R6/include $CPPFLAGS"
export CFLAGS="-I/usr/X11R6/include $CFLAGS"
export CXXFLAGS="-I/usr/X11R6/include $CXXFLAGS"
