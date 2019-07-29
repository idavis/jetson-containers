#!/bin/bash
set -e

echo "mkdir -p /tmp/${JETPACK_VERSION}/${DEVICE_ID}"
mkdir -p /tmp/${JETPACK_VERSION}/${DEVICE_ID}

echo "xvfb-run sdkmanager --cli downloadonly --user ${NV_USER} --logintype ${NV_LOGIN_TYPE} --product ${PRODUCT} --version ${JETPACK_VERSION} --targetos ${TARGET_OS} ${DEVICE_OPTION} ${DEVICE_ID} --flash skip --license ${ACCEPT_SDK_LICENCE} --downloadfolder /tmp/${JETPACK_VERSION}/${DEVICE_ID}"
xvfb-run sdkmanager --cli downloadonly --user ${NV_USER} --logintype ${NV_LOGIN_TYPE} --product ${PRODUCT} --version ${JETPACK_VERSION} --targetos ${TARGET_OS} ${DEVICE_OPTION} ${DEVICE_ID} --flash skip --license ${ACCEPT_SDK_LICENCE} --downloadfolder /tmp/${JETPACK_VERSION}/${DEVICE_ID}

