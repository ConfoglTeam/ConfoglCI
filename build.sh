#!/bin/bash
set -e

#update 

echo Updating hl2sdk-l4d2...
cd hl2sdk-l4d2
hg pull
hg update -C
cd ..

echo Updating mmsource-central...
cd mmsource-central
hg pull
hg update -C
cd ..

echo Updating sourcemod-central...
cd sourcemod-central
hg pull
hg update -C
cd ..

echo Updating left4downtown2...
cd left4downtown2
hg pull
hg update -C
cd ..

echo Updates complete.

# Setup build environ
d=$(pwd)

echo Setting up build environment in $d/build

export SOURCEMOD15=$d/sourcemod-central
export MMSOURCE19=$d/mmsource-central
export HL2SDKL4D2=$d/hl2sdk-l4d2
export HL2SDK_L4D2=$HL2SDKL4D2
export SMSDK=$SOURCEMOD15
export MMSOURCE=$MMSOURCE19
export SRCDS_BASE=$d/srcds
export MYSQL5=$d/mysql

rm -rf build
mkdir build

echo Copying files to build/
cp -R left4downtown2 build/

cd build

echo Building l4dt2
cd left4downtown2
make
make playerslots
cd ..

echo Build Complete. Packaging...

cd ..

rm -rf package
mkdir package

echo Installing Left4downtown2 to package...
cp build/left4downtown2/gamedata/left4downtown.l4d2.txt package/addons/sourcemod/gamedata/
cp build/left4downtown2/Release.playerslots/left4downtown.ext.2.l4d2.so package/addons/sourcemod/extensions/
cp build/left4downtown2/scripting/include/* package/addons/sourcemod/scripting/include/
touch package/addons/sourcemod/extensions/left4downtown.autoload

