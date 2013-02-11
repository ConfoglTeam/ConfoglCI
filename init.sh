#!/bin/bash
set -e

echo -------------------------
echo Cloning sourcemod-central
echo -------------------------
hg clone http://hg.alliedmods.net/sourcemod-central/ sourcemod-central

echo ------------------------
echo Cloning mmsource-central
echo ------------------------
hg clone http://hg.alliedmods.net/mmsource-central/ mmsource-central

echo -------------------
echo Cloning hl2sdk-l4d2
echo -------------------
hg clone http://hg.alliedmods.net/hl2sdks/hl2sdk-l4d2/ hl2sdk-l4d2

echo ----------------------
echo Cloning left4downtown2
echo ----------------------
hg clone https://code.google.com/p/left4downtown2/ left4downtown2

echo --------------
echo srcds binaries
echo --------------
mkdir -p srcds/left4dead2/
ln -sf $(pwd)/hl2sdk-l4d2/lib/linux srcds/left4dead2/bin

echo --------------------------
echo patching sourcemod-central
echo --------------------------
cd sourcemod-central
hg qimport ../notf2.patch

