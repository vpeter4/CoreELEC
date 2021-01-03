#!/bin/sh

rm -fr target

IMAGE_SUFFIX=vpeter-bd-$(date +%Y.%m.%d.%H.%M) RELEASE_NOTES=release_notes.txt make

./scripts/create_addon jre.zulu

exit 0
