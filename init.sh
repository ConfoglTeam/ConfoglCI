#!/bin/bash
set -e
hg clone http://hg.alliedmods.net/sourcemod-central/ sourcemod-central
hg clone http://hg.alliedmods.net/mmsource-central/ mmsource-central
hg clone http://hg.alliedmods.net/hl2sdks/hl2sdk-l4d2/ hl2sdk-l4d2
hg clone https://code.google.com/p/left4downtown2/ left4downtown2
mkdir -p srcds/left4dead2/
ln -sf $(pwd)/hl2sdk-l4d2/lib/linux srcds/left4dead2/bin
cd sourcemod-central
hg qimport ../notf2.patch

