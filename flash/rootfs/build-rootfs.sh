#!/bin/bash
set -e

source $1

tmp_dir=$(mktemp -d -t jc-XXXXXXXXXX)
echo $tmp_dir

echo "curl -sSL ${ROOT_FS_URL}/${ROOT_FS} -o ${tmp_dir}/${ROOT_FS}"
curl -sSL ${ROOT_FS_URL}/${ROOT_FS} -o ${tmp_dir}/${ROOT_FS}

echo "${ROOT_FS_SHA} *${tmp_dir}/${ROOT_FS}" | sha1sum -c --strict -

echo "${DOCKER} build ${DOCKER_BUILD_ARGS} -f \"rootfs.Dockerfile\" -t \"$2\" \\"
echo "    --build-arg ROOT_FS_URL=$ROOT_FS_URL \\"
echo "    --build-arg ROOT_FS=$ROOT_FS \\"
echo "    --build-arg ROOT_FS_SHA=$ROOT_FS_SHA \\"
echo "    --build-arg VERSION_ID=$VERSION_ID \\"
echo "    ${tmp_dir}"

${DOCKER} build ${DOCKER_BUILD_ARGS} -f "rootfs.Dockerfile" -t "$2" \
    --build-arg ROOT_FS_URL=$ROOT_FS_URL \
    --build-arg ROOT_FS=$ROOT_FS \
    --build-arg ROOT_FS_SHA=$ROOT_FS_SHA \
    --build-arg VERSION_ID=$VERSION_ID \
    ${tmp_dir}