#!/bin/bash
set -e

ROOT_FS_DIR=$(dirname ${ROOT_FS_ARCHIVE})
ROOT_FS=$(basename ${ROOT_FS_ARCHIVE})
ROOT_FS_CONF=$(basename -- ${ROOT_FS_ARCHIVE}).conf

ROOT_FS_MD5=$(md5sum ${ROOT_FS_ARCHIVE} | cut -d" " -f1 )

echo "${ROOT_FS_MD5} ${ROOT_FS_ARCHIVE}" | md5sum -c -

echo "${DOCKER} build ${DOCKER_BUILD_ARGS} -f \"rootfs-from-file.Dockerfile\" -t \"$1\" \\"
echo "    --build-arg ROOT_FS=$ROOT_FS \\"
echo "    --build-arg ROOT_FS_MD5=$ROOT_FS_MD5 \\"
echo "    --build-arg VERSION_ID=$VERSION_ID \\"
echo "    ."

${DOCKER} build ${DOCKER_BUILD_ARGS} -f "rootfs-from-file.Dockerfile" -t "$1" \
    --build-arg ROOT_FS=$ROOT_FS \
    --build-arg ROOT_FS_MD5=$ROOT_FS_MD5 \
    --build-arg VERSION_ID=$VERSION_ID \
    ${ROOT_FS_DIR}

echo "ROOT_FS=$ROOT_FS" >> $ROOT_FS_CONF
echo "ROOT_FS_MD5=$ROOT_FS_MD5" >> $ROOT_FS_CONF
echo "FS_DEPENDENCIES_IMAGE=$1" >> $ROOT_FS_CONF