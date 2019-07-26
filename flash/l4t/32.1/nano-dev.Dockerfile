ARG VERSION_ID
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies


ARG VERSION_ID
FROM ubuntu:${VERSION_ID} as qemu

# install qemu for the support of building containers on host
RUN apt-get update && apt-get install -y --no-install-recommends qemu-user-static && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# start of the real image base
ARG VERSION_ID
FROM ubuntu:${VERSION_ID}

# pre-req qemu binary for aarch64 emulation if this container image is built directly on x86 host
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

COPY --from=dependencies /data/${ROOT_FS} ${ROOT_FS}
RUN echo "${ROOT_FS_SHA} *./${ROOT_FS}" | sha1sum -c --strict - && \
    cd /Linux_for_Tegra/rootfs && \
    tar -xp --overwrite -f /${ROOT_FS} && \
    rm /${ROOT_FS} && \
    cd .. && \
    ./apply_binaries.sh

WORKDIR /Linux_for_Tegra/rootfs

RUN cp /usr/bin/qemu-aarch64-static usr/bin/ 

# Do any customer work with chroot
#RUN chroot . <command>

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
