#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Illegal number of parameters. The base environment file must be supplied"
    echo "Usage: $(basename "$(test -L "$0" && readlink "$0" || echo "$0")") <conf file> [tag]"
    exit 1
fi

if [ "$#" -gt 2 ]; then
    echo "Illegal number of parameters."
    echo "Usage: $(basename "$(test -L "$0" && readlink "$0" || echo "$0")") <conf file> [tag]"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "The conf file \"$1\" does not exist!"
    exit 2
fi

source "$1"

# The container tag will match the conf script name if it wasn't supplied.
if [ -z "$2" ]; then
    DOCKER_TAG="$(basename "$(test -L "$1" && readlink "$1" || echo "$1")")"
else
    DOCKER_TAG=$2
fi

if [ -z "$DRIVER_PACK_URL" ]; then
    echo "The DRIVER_PACK_URL variable must be set."
    exit 3
fi

if [ -z "$DRIVER_PACK" ]; then
    echo "The DRIVER_PACK variable must be set."
    exit 4
fi

if [ -z "$DRIVER_PACK_SHA" ]; then
    echo "The DRIVER_PACK_SHA variable must be set."
    exit 5
fi

if [ -z "$ROOT_FS_URL" ]; then
    echo "The ROOT_FS_URL variable must be set."
    exit 6
fi

if [ -z "$ROOT_FS" ]; then
    echo "The ROOT_FS variable must be set."
    exit 7
fi

if [ -z "$ROOT_FS_SHA" ]; then
    echo "The ROOT_FS_SHA variable must be set."
    exit 8
fi

if [ -z "$TARGET_BOARD" ]; then
    echo "The TARGET_BOARD variable must be set."
    exit 9
fi

if [ -z "$ROOT_DEVICE" ]; then
    ROOT_DEVICE=mmcblk0p1
fi

DEVICE=$(echo $TARGET_BOARD | awk -F"-" '{print $2}')

# Show what is going to be executed.
echo "sudo docker build -f "Dockerfile.${DEVICE}" -t "$DOCKER_TAG" \\"
echo "    --build-arg DRIVER_PACK_URL=$DRIVER_PACK_URL \\"
echo "    --build-arg DRIVER_PACK=$DRIVER_PACK \\"
echo "    --build-arg DRIVER_PACK_SHA=$DRIVER_PACK_SHA \\"
echo "    --build-arg ROOT_FS_URL=$ROOT_FS_URL \\"
echo "    --build-arg ROOT_FS=$ROOT_FS \\"
echo "    --build-arg ROOT_FS_SHA=$ROOT_FS_SHA \\"
echo "    --build-arg TARGET_BOARD=$TARGET_BOARD \\"
echo "    --build-arg ROOT_DEVICE=$ROOT_DEVICE \\"
echo "    ."

sudo docker build -f "Dockerfile.${DEVICE}" -t "$DOCKER_TAG" \
     --build-arg DRIVER_PACK_URL=$DRIVER_PACK_URL \
     --build-arg DRIVER_PACK=$DRIVER_PACK \
     --build-arg DRIVER_PACK_SHA=$DRIVER_PACK_SHA \
     --build-arg ROOT_FS_URL=$ROOT_FS_URL \
     --build-arg ROOT_FS=$ROOT_FS \
     --build-arg ROOT_FS_SHA=$ROOT_FS_SHA \
     --build-arg TARGET_BOARD=$TARGET_BOARD \
     --build-arg ROOT_DEVICE=$ROOT_DEVICE \
     .
