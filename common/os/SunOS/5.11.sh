if [ ! -r "/opt/dtbld/bin/env.sh" -a $PKG_NAME != "desktop-cbe" ];
then
  echo ERROR you must install the sun gnome desktop build first!
  echo See the README for more details
  exit 1
fi


# save some env vars
export HOSTNAME=$HOST
LESS_PREFIX=$PREFIX
LESS_NPKG_PATH=$NPKG_PATH
LESS_NPKG_PREFIX=$NPKG_PREFIX

echo
echo SOURCING Sun Gnome Desktop Build env.sh
echo
. /opt/dtbld/bin/env.sh

export HOST=$HOSTNAME
HOST_SHORT=${HOST%%.*}
export PREFIX=$LESS_PREFIX
export NPKG_PREFIX=$LESS_NPKG_PREFIX
export NPKG_PATH=$LESS_NPKG_PATH

export PATH="$PREFIX/bin:$PATH"
