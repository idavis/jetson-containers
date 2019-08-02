ARG VERSION_ID
ARG DEPENDENCIES_IMAGE
ARG FS_DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG VERSION_ID
ARG FS_DEPENDENCIES_IMAGE
FROM ${FS_DEPENDENCIES_IMAGE} as fs-dependencies

ARG VERSION_ID
FROM ubuntu:${VERSION_ID} as qemu

# install qemu for the support of building containers on host
RUN apt-get update && apt-get install -y --no-install-recommends qemu-user-static && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# start of the real image base
ARG VERSION_ID
FROM ubuntu:${VERSION_ID}

COPY --from=qemu /usr/bin/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apt-get update && apt-get install -y --allow-downgrades \
    bzip2=1.0.6-8.1 libbz2-1.0=1.0.6-8.1 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    apt-utils \
    bzip2 \
    curl \
    lbzip2 \
    libpython-stdlib \
    perl \
    python \
    python-minimal \
    python2.7 \
    python2.7-minimal \
    sudo \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG DRIVER_PACK
ARG DRIVER_PACK_SHA

COPY --from=dependencies /data/${DRIVER_PACK} ${DRIVER_PACK}
RUN echo "${DRIVER_PACK_SHA} *./${DRIVER_PACK}" | sha1sum -c --strict - && \
    tar -xp --overwrite -f ./${DRIVER_PACK} && \
    rm /${DRIVER_PACK}

ARG ROOT_FS
ARG ROOT_FS_SHA

COPY --from=fs-dependencies /data/${ROOT_FS} ${ROOT_FS}
RUN echo "${ROOT_FS_SHA} *./${ROOT_FS}" | sha1sum -c --strict - && \
    cd /Linux_for_Tegra/rootfs && \
    tar -xp --overwrite -f /${ROOT_FS} && \
    rm /${ROOT_FS} && \
    cd .. && \
    ./apply_binaries.sh

WORKDIR /Linux_for_Tegra/rootfs/etc/nvidia-container-runtime/host-files-for-container.d

COPY --from=dependencies /data/tensorrt.csv ./tensorrt.csv
RUN echo "e45328e07c8c8affa4f240f8045224a2 *./tensorrt.csv" | md5sum -c -

COPY --from=dependencies /data/visionworks.csv ./visionworks.csv
RUN echo "36226c350ae160154e7ddac9054dcbcf *./visionworks.csv" | md5sum -c -

COPY --from=dependencies /data/cudnn.csv ./cudnn.csv
RUN echo "4e940a0228f6f5e833b790cdfbadc587 *./cudnn.csv" | md5sum -c -

COPY --from=dependencies /data/cuda.csv ./cuda.csv
RUN echo "fb0c10c402cedd491d335ae7c06abe38 *./cuda.csv" | md5sum -c -

WORKDIR /Linux_for_Tegra/rootfs

RUN cp /usr/bin/qemu-aarch64-static usr/bin/ 

COPY --from=dependencies /data/libnvidia-container0_0.9.0~beta.1_arm64.deb ./libnvidia-container0_0.9.0~beta.1_arm64.deb
RUN echo "c343f119238659c724732da212163e83 *./libnvidia-container0_0.9.0~beta.1_arm64.deb" | md5sum -c - && \
    chroot . dpkg -i libnvidia-container0_0.9.0~beta.1_arm64.deb && \
    rm ./libnvidia-container0_0.9.0~beta.1_arm64.deb

COPY --from=dependencies /data/libnvidia-container-tools_0.9.0~beta.1_arm64.deb ./libnvidia-container-tools_0.9.0~beta.1_arm64.deb
RUN echo "f7a3983260a0f22d0b3fd84829952794 *./libnvidia-container-tools_0.9.0~beta.1_arm64.deb" | md5sum -c - && \
    chroot . dpkg -i libnvidia-container-tools_0.9.0~beta.1_arm64.deb && \
    rm ./libnvidia-container-tools_0.9.0~beta.1_arm64.deb

COPY --from=dependencies /data/nvidia-container-runtime-hook_0.9.0_beta.1-1_arm64.deb ./nvidia-container-runtime-hook_0.9.0_beta.1-1_arm64.deb
RUN echo "eea9689265c917e0f7a0343d3dbb9104 *./nvidia-container-runtime-hook_0.9.0_beta.1-1_arm64.deb" | md5sum -c - && \
    chroot . dpkg -i nvidia-container-runtime-hook_0.9.0_beta.1-1_arm64.deb && \
    rm ./nvidia-container-runtime-hook_0.9.0_beta.1-1_arm64.deb

COPY --from=dependencies /data/nvidia-container-runtime_0.9.0_beta.1+docker18.09.2-1_arm64.deb ./nvidia-container-runtime_0.9.0_beta.1+docker18.09.2-1_arm64.deb
RUN echo "d0d30b50f48f05f6263caf43136c90da *./nvidia-container-runtime_0.9.0_beta.1+docker18.09.2-1_arm64.deb" | md5sum -c - && \
    chroot . dpkg -i nvidia-container-runtime_0.9.0_beta.1+docker18.09.2-1_arm64.deb && \
    rm ./nvidia-container-runtime_0.9.0_beta.1+docker18.09.2-1_arm64.deb

COPY --from=dependencies /data/nvidia-docker2_0.9.0_beta.1+docker18.09.2-1_arm64.deb ./nvidia-docker2_0.9.0_beta.1+docker18.09.2-1_arm64.deb
RUN echo "b78d6f3cdc1a8b6623979394e7242341 *./nvidia-docker2_0.9.0_beta.1+docker18.09.2-1_arm64.deb" | md5sum -c - && \
    chroot . dpkg -i nvidia-docker2_0.9.0_beta.1+docker18.09.2-1_arm64.deb && \
    rm ./nvidia-docker2_0.9.0_beta.1+docker18.09.2-1_arm64.deb

RUN rm usr/bin/qemu-aarch64-static

WORKDIR /Linux_for_Tegra

ARG TARGET_BOARD
ARG ROOT_DEVICE
ENV TARGET_BOARD=$TARGET_BOARD
ENV ROOT_DEVICE=$ROOT_DEVICE

RUN echo "#!/bin/bash" >> entrypoint.sh && \
    echo "echo \"sudo ./flash.sh \$* ${TARGET_BOARD} ${ROOT_DEVICE}\"" >> entrypoint.sh && \
    echo "sudo ./flash.sh \$* ${TARGET_BOARD} ${ROOT_DEVICE}" >> entrypoint.sh && \
    chmod +x entrypoint.sh

ENTRYPOINT ["sh", "-c", "sudo ./entrypoint.sh $*", "--"]
