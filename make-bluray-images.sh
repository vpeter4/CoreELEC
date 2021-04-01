#!/bin/sh

rm -fr target

IMAGE_SUFFIX=vpeter-bd-$(date +%Y.%m.%d.%H.%M) RELEASE_NOTES=release_notes.txt PROJECT=Amlogic-ng make

IMAGE_SUFFIX=vpeter-bd-$(date +%Y.%m.%d.%H.%M) RELEASE_NOTES=release_notes.txt PROJECT=Amlogic make

exit 0

PROJECT=Amlogic-ng ./scripts/create_addon jre.zulu
PROJECT=Amlogic ./scripts/create_addon jre.zulu

exit 0

BUILD_SUFFIX=bd IMAGE_SUFFIX=vpeter-bd-$(date +%Y.%m.%d.%H.%M) RELEASE_NOTES=release_notes.txt PROJECT=Amlogic-ng make

BUILD_SUFFIX=bd IMAGE_SUFFIX=vpeter-bd-$(date +%Y.%m.%d.%H.%M) RELEASE_NOTES=release_notes.txt PROJECT=Amlogic make
