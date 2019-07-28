#!/bin/bash
set -e

if [ -z "$JETPACK_VERSION" ]; then
    >&2 echo "The JETPACK_VERSION variable must be set."
    exit 1
fi

if [ -z "$DEVICE_ID" ]; then
    >&2 echo "The DEVICE_ID variable must be set."
    exit 2
fi

if [ -z "$NV_USER" ]; then
    >&2 echo "The NV_USER variable must be set."
    exit 3
fi

if [ -z "$NV_LOGIN_TYPE" ]; then
    >&2 echo "The NV_LOGIN_TYPE variable must be set."
    exit 4
fi

if [ -z "$PRODUCT" ]; then
    >&2 echo "The PRODUCT variable must be set."
    exit 5
fi

if [ -z "$TARGET_OS" ]; then
    >&2 echo "The TARGET_OS variable must be set."
    exit 6
fi

if [ -z "$DEVICE_OPTION" ]; then
    >&2 echo "The DEVICE_OPTION variable must be set."
    exit 7
fi

if [ -z "$ACCEPT_SDK_LICENCE" ]; then
    >&2 echo "The ACCEPT_SDK_LICENCE variable must be set."
    exit 8
fi

if [[ $(uname -a) == *"-microsoft-"* ]]; then
	# Check if xvfb installed 
	if [ -x "$(command -v xvfb-run)" ]; 
	then
	    XVFB=$(which xvfb-run)
	else
	    >&2 echo "xvfb is required in this enironment, please install xvfb and try again"
	    exit 9
	fi
fi

echo "mkdir -p /tmp/${JETPACK_VERSION}/${DEVICE_ID}"
mkdir -p /tmp/${JETPACK_VERSION}/${DEVICE_ID}

echo "${XVFB} sdkmanager --cli downloadonly --user ${NV_USER} --logintype ${NV_LOGIN_TYPE} --product ${PRODUCT} --version ${JETPACK_VERSION} --targetos ${TARGET_OS} ${DEVICE_OPTION} ${DEVICE_ID} --flash skip --license ${ACCEPT_SDK_LICENCE} --downloadfolder /tmp/${JETPACK_VERSION}/${DEVICE_ID}"
${XVFB} sdkmanager --cli downloadonly --user ${NV_USER} --logintype ${NV_LOGIN_TYPE} --product ${PRODUCT} --version ${JETPACK_VERSION} --targetos ${TARGET_OS} ${DEVICE_OPTION} ${DEVICE_ID} --flash skip --license ${ACCEPT_SDK_LICENCE} --downloadfolder /tmp/${JETPACK_VERSION}/${DEVICE_ID}

