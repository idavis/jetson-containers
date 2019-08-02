ARG VERSION_ID
ARG DEPENDENCIES_IMAGE
ARG FS_DEPENDENCIES_IMAGE
ARG BSP_DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG VERSION_ID
ARG FS_DEPENDENCIES_IMAGE
ARG BSP_DEPENDENCIES_IMAGE
FROM ${FS_DEPENDENCIES_IMAGE} as fs-dependencies

ARG VERSION_ID
ARG BSP_DEPENDENCIES_IMAGE
FROM ${BSP_DEPENDENCIES_IMAGE} as bsp-dependencies


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
    rm /${ROOT_FS}
 
WORKDIR /Linux_for_Tegra

ARG BSP
ARG BSP_SHA

# apply_binaries is handled in the install.sh
COPY --from=bsp-dependencies /data/${BSP} ${BSP}
RUN echo "${BSP_SHA} *./${BSP}" | sha1sum -c --strict - && \
    tar -xzf ${BSP} && \
    cd ./CTI-L4T && \
    sudo ./install.sh

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
