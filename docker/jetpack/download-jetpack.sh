#!/bin/bash
set -e

# Enable support for running sdkmanager in headless environments like WSL
if [[ $(uname -a) == *"-microsoft-"* ]]; then
    
    # Check if xvfb installed 
    if [ -x "$(command -v xvfb-run)" ]; 
    then
        XVFB=$(which xvfb-run)
    else
        echo "xvfb is required in this enironment, please install xvfb and try again"
        exit 1
    fi
fi

echo "mkdir -p /tmp/${JETPACK_VERSION}/${DEVICE_ID}"
mkdir -p /tmp/${JETPACK_VERSION}/${DEVICE_ID}

echo "${XVFB} sdkmanager --cli downloadonly --user ${NV_USER} --logintype ${NV_LOGIN_TYPE} --product ${PRODUCT} --version ${JETPACK_VERSION} --targetos ${TARGET_OS} ${DEVICE_OPTION} ${DEVICE_ID} --flash skip --license ${ACCEPT_SDK_LICENCE} --downloadfolder /tmp/${JETPACK_VERSION}/${DEVICE_ID}"
${XVFB} sdkmanager --cli downloadonly --user ${NV_USER} --logintype ${NV_LOGIN_TYPE} --product ${PRODUCT} --version ${JETPACK_VERSION} --targetos ${TARGET_OS} ${DEVICE_OPTION} ${DEVICE_ID} --flash skip --license ${ACCEPT_SDK_LICENCE} --downloadfolder /tmp/${JETPACK_VERSION}/${DEVICE_ID}

