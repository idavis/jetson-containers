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
ARG DRIVER_PACK_MD5

COPY --from=dependencies /data/${DRIVER_PACK} ${DRIVER_PACK}

RUN echo "${DRIVER_PACK_MD5} *./${DRIVER_PACK}" | md5sum -c - && \
    tar -xp --overwrite -f ./${DRIVER_PACK} && \
    rm /${DRIVER_PACK}

ARG ROOT_FS
ARG ROOT_FS_MD5

COPY --from=fs-dependencies /data/${ROOT_FS} ${ROOT_FS}
RUN echo "${ROOT_FS_MD5} *./${ROOT_FS}" | md5sum -c - && \
    cd /Linux_for_Tegra/rootfs && \
    tar -xp --overwrite -f /${ROOT_FS} && \
    rm /${ROOT_FS}

WORKDIR /Linux_for_Tegra

ARG TARGET_BOARD
ARG ROOT_DEVICE
ENV TARGET_BOARD=$TARGET_BOARD
ENV ROOT_DEVICE=$ROOT_DEVICE

RUN echo "#!/bin/bash" >> entrypoint.sh && \
    echo "sudo ./apply_binaries.sh" >> entrypoint.sh && \
    echo "echo \"sudo ./flash.sh \$* ${TARGET_BOARD} ${ROOT_DEVICE}\"" >> entrypoint.sh && \
    echo "sudo ./flash.sh \$* ${TARGET_BOARD} ${ROOT_DEVICE}" >> entrypoint.sh && \
    chmod +x entrypoint.sh

ENTRYPOINT ["sh", "-c", "sudo ./entrypoint.sh $*", "--"]