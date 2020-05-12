#!/bin/sh

DIR="$(basename $(pwd))"
echo "Backing up folder: $DIR"

cd ..

if [ ! -d "$DIR" ]; then
  echo "Folder '$DIR' does not exist."
  exit 1
fi

MY_SUFFIX=""
if [ "$#" -gt 0 ]; then
  for arg in "$@"; do
	  MY_SUFFIX+="-$arg"
  done
fi

#echo "MY_SUFFIX: -$MY_SUFFIX-"

MY_DATE=$(date +%Y-%m-%d-%H-%M)
MY_TAR_FILE="$DIR-${MY_DATE}${MY_SUFFIX}.tar"

MY_TAR_FILE="/home/pvic/tmp/$MY_TAR_FILE"

tar --exclude="$DIR/build.CoreELEC-*" \
		--exclude="$DIR/overlay_build" \
		--exclude="$DIR/target" \
		--exclude="$DIR/.work" \
		-cf "$MY_TAR_FILE" \
		"$DIR"

echo "Done back up: $(dirname $MY_TAR_FILE)"
echo "  $(basename $MY_TAR_FILE)"


exit 0
