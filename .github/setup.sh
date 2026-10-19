#!/bin/bash
set -e
export ANDROID_HOME=$HOME/android-sdk
mkdir -p $ANDROID_HOME/cmdline-tools
cd $ANDROID_HOME/cmdline-tools
cat setup.sh
curl -sSLo tools.zip [dl.google.com](https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip)
unzip -q tools.zip
mv cmdline-tools latest
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
yes | sdkmanager --licenses > /dev/null 2>&1 || true
sdkmanager platform-tools > /dev/null
sdkmanager platforms\;android-34 > /dev/null
sdkmanager build-tools\;34.0.0 > /dev/null
echo sdk.dir=$ANDROID_HOME > $GITHUB_WORKSPACE/src/local.properties
cd $GITHUB_WORKSPACE/src
gradle assembleDebug --stacktrace --no-daemon
