if [ ! -r "/opt/dtbld/bin/env.sh" -a $PKG_NAME != "desktop-cbe" ];
then
  echo ERROR you must install the sun gnome desktop build first!
  echo See the README for more details
  exit 1
fi

FORCE_ORIG=$FORCE
LD_CONFIG_ORIG=$LD_CONFIG
NPKGS_CONTEXT_ORIG=$NPKGS_CONTEXT

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

# reset custom LD_CONFIG
if [ -r "$LD_CONFIG_ORIG" ]
then
    export LD_CONFIG=$LD_CONFIG_ORIG
    echo
    echo "RESET CUSTOM LD_CONFIG: $LD_CONFIG"
    echo
fi

FORCE=$FORCE_ORIG
NPKGS_CONTEXT=$NPKGS_CONTEXT_ORIG