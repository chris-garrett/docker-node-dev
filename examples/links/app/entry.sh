#!/bin/bash

set -e

SRC="/work/app"
LIBS="/work/libs"

if [ ! -z "$NPM_SRC" ]; then
  echo "You have specified an alternative source dir: $NPM_SRC"
  src=$NPM_SRC
else
  echo "Using default source dir: $src"
fi

if [ ! -z "$NPM_LIBS" ]; then
  echo "You have specified an alternative libs dir: $NPM_LIBS"
  LIBS=$NPM_LIBS
else
  echo "Using default libs dir: $LIBS"
fi


# setup links
if [ -d "$LIBS" ]; then
    echo "linking $LIBS"
  for fn in `ls -d -1 $LIBS/*/`; do
      BN=`basename $fn`
      cd $fn && npm link
      cd "$SRC" && npm link $BN
  done
fi

echo "Executing command ($@)"
exec "$@"
