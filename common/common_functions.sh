# Common functions for build scripts

function common_untar
{
    TARPATH="$DISTFILES/$TARBALL"

    if [ ! -r $TARPATH ]; then
        echo ERROR: no tarball found: $TARPATH
        exit 1
    fi

    mkdir work && cd work

    echo "/usr/bin/gzcat $TARPATH | $TAR -xvf -"
    if ! /usr/bin/gzcat "$TARPATH" | $TAR -xvf -
    then
        echo ERROR: untarring error
    fi
}

function common_untar_bzip
{
    TARPATH="$DISTFILES/$TARBALL"

    if [ ! -r $TARPATH ]; then
        echo ERROR: no tarball found: $TARPATH
        exit 1
    fi

    mkdir work && cd work

    echo "/usr/bin/bzcat $TARPATH | $TAR -xvf -"
    if ! /usr/bin/bzcat "$TARPATH" | $TAR -xvf -
    then
        echo ERROR: untarring error
    fi
}

function common_fetch
{
    # acquire tarball
    if [ ! -r "$DISTFILES/$TARBALL" ]; then
        echo "ACQUIRING TARBALL: $TARBALL..."
        wget $URL
        mv $TARBALL $DISTFILES/
    fi

}

function common_clean
{
    # remove previous build
    if [ -d "work" ]; then
        echo "removing previous build"
        rm -rf work;
    fi
}

function common_prereqs
{
    echo "Checking if package is already installed"
    echo
    if [ -d "$PKG_PREFIX" ]; then
        echo "ERROR: Package already installed in $PKG_PREFIX"
        if [ -z "$FORCE" ]; then
            echo "   Remove the directory or set FORCE=1 if you want to install again anyway"
            exit 1
        fi
        echo "Package installation forced!"
        echo
    fi
    echo
    echo
    echo "Checking for prereqs..."
    echo
    for pkgname in $PREREQS
    do
        echo -n "Checking PREREQ: $pkgname... "
        if [ -d "$PREFIX/root/$pkgname" ]
        then
            echo "... Found"
        else
            echo
            echo
            echo "Error: PREREQ not found: $PREFIX/root/$pkgname"
            exit 1
        fi
    done

    echo "PREREQ check complete."
    echo
}

function common_configure
{
    echo
    echo
    echo "CONFIGURING: $CONFIGURE"
    echo
    $CONFIGURE                           || exit

}

function common_make
{
    echo
    echo
    echo "Building: $MAKE"
    echo
    $MAKE                                || exit
}

function common_install
{
    if [ ! -z "$BACKUP" ]; then
        echo
        echo
        if [ -r "$PKG_PREFIX" ]; then
            if [ -r "$PKG_PREFIX.bak" ]; then
                echo "Removing previous backup..."
                rm -rf $PKG_PREFIX.bak
            fi
            echo "BACKING UP: $PKG_PREFIX..."
            mv $PKG_PREFIX $PKG_PREFIX.bak
        fi
    fi
    echo
    echo
    echo "INSTALLING: $MAKE install"
    echo
    $MAKE install || exit

}

function common_patch
{
    PATCH=$1
    [ -z "$PATCH" ] && echo no patch specified && exit 1

    PATCHDIR="../../files/"
    [ ! -r "$PATCHDIR/$PATCH" ] && echo no patch found: $PATCH && exit 1

    # apply the patch
    echo
    echo
    echo APPLYING PATCH: $PATCH
    echo
    echo /usr/bin/gpatch \< "$PATCHDIR/$PATCH"
    /usr/bin/gpatch < "$PATCHDIR/$PATCH" || exit
    echo APPLIED!
}

function common_install_links
{
    if [ -z "$PKG_PREFIX" ]; then
      echo "ERROR: PKG_PREFIX not set!"
      return;
    fi

    if [ -z "$PKG_NAME" ]; then
      echo "ERROR: PKG_NAME not set!"
      return;
    fi

  (
    cd $NPKG_PREFIX/root
    rm $PKG_NAME
    ln -s $PKG_PREFIX $PKG_NAME

    PKG_DIR="`pwd`/$PKG_NAME"

    print "CHECKING FOR FILES IN: $NPKG_PREFIX/root/$PKG_NAME/"
    for file in $(find $PKG_NAME/)
    do
      if [ -d "$file" ]; then
          file="${file#$PKG_NAME/}"
          if [ ! -d "$NPKG_PREFIX/$file" ]; then
            echo "$NPKG_PREFIX/$file"
            mkdir -p "$NPKG_PREFIX/$file"
          fi
      else
          file="${file#$PKG_NAME/}"
          PKG_PREFIX="${PKG_PREFIX%/}"
          if [ -r "$NPKG_PREFIX/$file" ]; then
	      echo "REPLACING WITH LINK: $NPKG_PREFIX/$file"
              rm  $NPKG_PREFIX/$file
          fi
          ln -s $PKG_DIR/$file $NPKG_PREFIX/$file
      fi

    done
  )
}


