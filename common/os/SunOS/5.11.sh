

if [ ! -r "/opt/dtbld/bin/env.sh" ];
then
  echo ERROR you must install the sun gnone desktop build first!
  exit 1
fi


# save some env vars
export HOSTNAME=$HOST
LESS_PREFIX=$PREFIX
LESS_NPKG_PATH=$NPKG_PATH
LESS_NPKG_PREFIX=$NPKG_PREFIX

echo
echo SOURCING Sun Gnone Desktop Build env.sh
echo
. /opt/dtbld/bin/env.sh

export HOST=$HOSTNAME
HOST_SHORT=${HOST%%.*}
export PREFIX=$LESS_PREFIX
export NPKG_PREFIX=$LESS_NPKG_PREFIX
export NPKG_PATH=$LESS_NPKG_PATH