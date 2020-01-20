#!/bin/bash
set -e

MACHINE="$(${DOCKER} run ${DOCKER_RUN_ARGS} --rm busybox uname -m)"

if [ "${MACHINE}" != "x86_64" ]; then
    >&2 echo "The command must be run on an x86_64 host but ${MACHINE} was detected."
    >&2 echo "If using the DOCKER_HOST variable, ensure that it is pointing to an x86_64 host."
    exit 1
fi

echo "Moving into ${DOCKER_BUILD_ROOT}"
pushd "${DOCKER_BUILD_ROOT}"
{
    if [ "$#" -eq 2 ]; then
        source "$1"
        DOCKER_TAG=$2
    fi

    if [ "$#" -eq 3 ]; then
        source "$1"
        source "$2"
        DOCKER_TAG=$3
    fi


    if [ -z "$DEPENDENCIES_IMAGE" ]; then
        >&2 echo "The DEPENDENCIES_IMAGE variable must be set."
        exit 3
    fi

    if [ -z "$DRIVER_PACK" ]; then
        >&2 echo "The DRIVER_PACK variable must be set."
        exit 4
    fi

    if [ -z "$DRIVER_PACK_MD5" ]; then
        >&2 echo "The DRIVER_PACK_MD5 variable must be set."
        exit 5
    fi

    if [ -z "$ROOT_FS" ]; then
        >&2 echo "The ROOT_FS variable must be set."
        exit 7
    fi

    if [ -z "$ROOT_FS_MD5" ]; then
        >&2 echo "The ROOT_FS_MD5 variable must be set."
        exit 8
    fi

    if [ -z "$TARGET_BOARD" ]; then
        >&2 echo "The TARGET_BOARD variable must be set."
        exit 9
    fi

    if [ -z "$FS_DEPENDENCIES_IMAGE" ]; then
        >&2 echo "The FS_DEPENDENCIES_IMAGE variable must be set."
        exit 10
    fi

    if [ -z "$ROOT_DEVICE" ]; then
        ROOT_DEVICE=mmcblk0p1
    fi

    if [ -z "$DOCKERFILE_PREFIX" ]; then
        DOCKERFILE_PREFIX="default"
    fi

    if [ -z "DOCKER_BUILD_ROOT" ]; then
        DOCKER_BUILD_ROOT="./"
    fi

    # Show what is going to be executed.
    echo "${DOCKER} build ${DOCKER_BUILD_ARGS} -f "${DOCKER_BUILD_ROOT}/${DOCKERFILE_PREFIX}.Dockerfile" -t "$DOCKER_TAG" \\"
    echo "    --build-arg DEPENDENCIES_IMAGE=$DEPENDENCIES_IMAGE \\"
    echo "    --build-arg DRIVER_PACK=$DRIVER_PACK \\"
    echo "    --build-arg DRIVER_PACK_MD5=$DRIVER_PACK_MD5 \\"
    echo "    --build-arg FS_DEPENDENCIES_IMAGE=$FS_DEPENDENCIES_IMAGE \\"
    echo "    --build-arg ROOT_FS=$ROOT_FS \\"
    echo "    --build-arg ROOT_FS_MD5=$ROOT_FS_MD5 \\"
    echo "    --build-arg BSP_DEPENDENCIES_IMAGE=$BSP_DEPENDENCIES_IMAGE \\"
    echo "    --build-arg BSP=$BSP \\"
    echo "    --build-arg BSP_SHA=$BSP_SHA \\"
    echo "    --build-arg TARGET_BOARD=$TARGET_BOARD \\"
    echo "    --build-arg ROOT_DEVICE=$ROOT_DEVICE \\"
    echo "    --build-arg VERSION_ID=$VERSION_ID \\"
    echo "    ."


    ${DOCKER} build ${DOCKER_BUILD_ARGS} -f "${DOCKERFILE_PREFIX}.Dockerfile" -t "$DOCKER_TAG" \
        --build-arg DEPENDENCIES_IMAGE=$DEPENDENCIES_IMAGE \
        --build-arg DRIVER_PACK=$DRIVER_PACK \
        --build-arg DRIVER_PACK_MD5=$DRIVER_PACK_MD5 \
        --build-arg FS_DEPENDENCIES_IMAGE=$FS_DEPENDENCIES_IMAGE \
        --build-arg ROOT_FS=$ROOT_FS \
        --build-arg ROOT_FS_MD5=$ROOT_FS_MD5 \
        --build-arg BSP_DEPENDENCIES_IMAGE=$BSP_DEPENDENCIES_IMAGE \
        --build-arg BSP=$BSP \
        --build-arg BSP_SHA=$BSP_SHA \
        --build-arg TARGET_BOARD=$TARGET_BOARD \
        --build-arg ROOT_DEVICE=$ROOT_DEVICE \
        --build-arg VERSION_ID=$VERSION_ID \
        .
} || {
    popd
}
