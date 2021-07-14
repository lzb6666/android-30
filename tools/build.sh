#!/bin/bash

/opt/tools/android-sdk-update.sh built-in

/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "cmdline-tools;latest"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "platforms;android-30"