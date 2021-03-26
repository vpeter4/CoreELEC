#!/bin/sh

rm -fr target

IMAGE_SUFFIX=bdj-$(date +%Y.%m.%d.%H.%M) RELEASE_NOTES=release_notes.txt make

#./scripts/create_addon jre.zulu
#mv target/addons/19.0/Amlogic-ce/arm/tools.jre.zulu/tools.jre.zulu-*.zip target
#rm -fr target/addons

exit 0
