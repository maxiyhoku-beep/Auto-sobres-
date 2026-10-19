#!/bin/bash
set -e
SDK=/usr/local/lib/android/sdk
echo "SDK dir: $SDK"
ls $SDK
echo "sdk.dir=$SDK" > $GITHUB_WORKSPACE/src/local.properties
cat $GITHUB_WORKSPACE/src/local.properties
cd $GITHUB_WORKSPACE/src
gradle assembleDebug --stacktrace --no-daemon
