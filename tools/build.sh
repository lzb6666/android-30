#!/bin/bash

/opt/tools/android-sdk-update.sh built-in

/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "cmdline-tools;latest"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "build-tools;30.0.2"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "platform-tools"
/opt/android-sdk-linux/cmdline-tools/tools/bin/sdkmanager "platforms;android-30"