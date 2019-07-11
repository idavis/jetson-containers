#!/bin/bash

MACHINE="$(${DOCKER} run ${DOCKER_RUN_ARGS} --rm busybox uname -m)"

if [ "${MACHINE}" != "x86_64" ]; then
    >&2 echo "The command must be run on an x86_64 host but ${MACHINE} was detected."
    >&2 echo "If using the DOCKER_HOST variable, ensure that it is pointing to an x86_64 host."
    exit 1
fi

if [ "$#" -eq 2 ]; then
    source "$1"
    DOCKER_TAG=$2
fi

if [ "$#" -eq 3 ]; then
    source "$1"
    source "$2"
    DOCKER_TAG=$3
fi


if [ -z "$DRIVER_PACK_URL" ]; then
    >&2 echo "The DRIVER_PACK_URL variable must be set."
    exit 3
fi

if [ -z "$DRIVER_PACK" ]; then
    >&2 echo "The DRIVER_PACK variable must be set."
    exit 4
fi

if [ -z "$DRIVER_PACK_SHA" ]; then
    >&2 echo "The DRIVER_PACK_SHA variable must be set."
    exit 5
fi

if [ -z "$ROOT_FS_URL" ]; then
    >&2 echo "The ROOT_FS_URL variable must be set."
    exit 6
fi

if [ -z "$ROOT_FS" ]; then
    >&2 echo "The ROOT_FS variable must be set."
    exit 7
fi

if [ -z "$ROOT_FS_SHA" ]; then
    >&2 echo "The ROOT_FS_SHA variable must be set."
    exit 8
fi

if [ -z "$TARGET_BOARD" ]; then
    >&2 echo "The TARGET_BOARD variable must be set."
    exit 9
fi

if [ -z "$ROOT_DEVICE" ]; then
    ROOT_DEVICE=mmcblk0p1
fi

if [ -z "$DEVICE" ]; then
    DEVICE=$(echo $TARGET_BOARD | awk -F"-" '{print $2}')
fi

# Show what is going to be executed.
echo "${DOCKER} build ${DOCKER_BUILD_ARGS} -f "${DEVICE}.Dockerfile" -t "$DOCKER_TAG" \\"
echo "    --build-arg DRIVER_PACK_URL=$DRIVER_PACK_URL \\"
echo "    --build-arg DRIVER_PACK=$DRIVER_PACK \\"
echo "    --build-arg DRIVER_PACK_SHA=$DRIVER_PACK_SHA \\"
echo "    --build-arg ROOT_FS_URL=$ROOT_FS_URL \\"
echo "    --build-arg ROOT_FS=$ROOT_FS \\"
echo "    --build-arg ROOT_FS_SHA=$ROOT_FS_SHA \\"
echo "    --build-arg BSP_URL=$BSP_URL \\"
echo "    --build-arg BSP=$BSP \\"
echo "    --build-arg BSP_SHA=$BSP_SHA \\"
echo "    --build-arg TARGET_BOARD=$TARGET_BOARD \\"
echo "    --build-arg ROOT_DEVICE=$ROOT_DEVICE \\"
echo "    --build-arg VERSION_ID=$VERSION_ID \\"
echo "    ."

${DOCKER} build ${DOCKER_BUILD_ARGS} -f "${DEVICE}.Dockerfile" -t "$DOCKER_TAG" \
     --build-arg DRIVER_PACK_URL=$DRIVER_PACK_URL \
     --build-arg DRIVER_PACK=$DRIVER_PACK \
     --build-arg DRIVER_PACK_SHA=$DRIVER_PACK_SHA \
     --build-arg ROOT_FS_URL=$ROOT_FS_URL \
     --build-arg ROOT_FS=$ROOT_FS \
     --build-arg ROOT_FS_SHA=$ROOT_FS_SHA \
     --build-arg BSP_URL=$BSP_URL \
     --build-arg BSP=$BSP \
     --build-arg BSP_SHA=$BSP_SHA \
     --build-arg TARGET_BOARD=$TARGET_BOARD \
     --build-arg ROOT_DEVICE=$ROOT_DEVICE \
     --build-arg VERSION_ID=$VERSION_ID \
     .
