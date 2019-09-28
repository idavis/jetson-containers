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

WORKDIR /Linux_for_Tegra/rootfs

RUN cp /usr/bin/qemu-aarch64-static usr/bin/ 

RUN echo "#!/bin/bash" >> configure-chroot.sh && \
    echo "cp /etc/resolv.conf etc/resolv.conf.host" >> configure-chroot.sh && \
    echo "mount --bind /dev/ dev/" >> configure-chroot.sh && \
    echo "mount --bind /sys/ sys/" >> configure-chroot.sh && \
    echo "mount --bind /proc/ proc/" >> configure-chroot.sh && \
    chmod +x configure-chroot.sh

RUN echo "#!/bin/bash" >> install-iot-edge.sh && \
    echo "cp -P /etc/resolv.conf /etc/resolv.conf.saved" >> install-iot-edge.sh && \
    echo "rm /etc/resolv.conf" >> install-iot-edge.sh && \
    echo "cp /etc/resolv.conf.host /etc/resolv.conf" >> install-iot-edge.sh && \
    echo "apt update" >> install-iot-edge.sh && \
    echo "apt install ca-certificates gpg curl -y --no-install-recommends" >> install-iot-edge.sh && \
    echo "curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list" >> install-iot-edge.sh && \
    echo "mv ./microsoft-prod.list /etc/apt/sources.list.d/" >> install-iot-edge.sh && \
    echo "curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg" >> install-iot-edge.sh && \
    echo "mv ./microsoft.gpg /etc/apt/trusted.gpg.d/" >> install-iot-edge.sh && \
    echo "apt remove --purge -y *docker*" >> install-iot-edge.sh && \
    echo "apt update" >> install-iot-edge.sh && \
    echo "apt-get install moby-engine -y --no-install-recommends" >> install-iot-edge.sh && \
    echo "apt-get install moby-cli -y --no-install-recommends" >> install-iot-edge.sh && \
    echo "apt-get install iotedge -y --no-install-recommends" >> install-iot-edge.sh && \
    echo "rm /etc/resolv.conf" >> install-iot-edge.sh && \
    echo "cp -P /etc/resolv.conf.saved /etc/resolv.conf" >> install-iot-edge.sh && \
    echo "rm /etc/resolv.conf.saved" >> install-iot-edge.sh && \
    echo "rm /etc/resolv.conf.host" >> install-iot-edge.sh && \
    echo "exit" >> install-iot-edge.sh && \
    chmod +x install-iot-edge.sh

RUN echo "#!/bin/bash" >> cleanup-chroot.sh && \
    echo "umount ./proc" >> cleanup-chroot.sh && \
    echo "umount ./sys" >> cleanup-chroot.sh && \
    echo "umount ./dev" >> cleanup-chroot.sh && \
    echo "cp -P etc/resolv.conf.saved etc/resolv.conf" >> cleanup-chroot.sh && \
    echo "rm etc/resolv.conf.saved" >> cleanup-chroot.sh && \
    echo "rm usr/bin/qemu-aarch64-static" >> cleanup-chroot.sh && \
    chmod +x cleanup-chroot.sh

WORKDIR /Linux_for_Tegra

ARG TARGET_BOARD
ARG ROOT_DEVICE
ENV TARGET_BOARD=$TARGET_BOARD
ENV ROOT_DEVICE=$ROOT_DEVICE

RUN echo "#!/bin/bash" >> entrypoint.sh && \
    echo "set -e" >> entrypoint.sh && \
    echo "cd /Linux_for_Tegra/rootfs" >> entrypoint.sh && \
    echo "./configure-chroot.sh" >> entrypoint.sh && \
    echo "chroot . /bin/bash -c ./install-iot-edge.sh" >> entrypoint.sh && \
    echo "./cleanup-chroot.sh" >> entrypoint.sh && \
    echo "rm configure-chroot.sh" >> entrypoint.sh && \
    echo "rm install-iot-edge.sh" >> entrypoint.sh && \
    echo "rm cleanup-chroot.sh" >> entrypoint.sh && \
    echo "cd /Linux_for_Tegra" >> entrypoint.sh && \
    echo "[ -f /conf/config.yaml ] && sudo cp /conf/config.yaml /Linux_for_Tegra/rootfs/etc/iotedge/config.yaml" >> entrypoint.sh && \
    echo "echo \"sudo ./flash.sh \$* ${TARGET_BOARD} ${ROOT_DEVICE}\"" >> entrypoint.sh && \
    echo "sudo ./flash.sh \$* ${TARGET_BOARD} ${ROOT_DEVICE}" >> entrypoint.sh && \
    chmod +x entrypoint.sh

ENTRYPOINT ["sh", "-c", "sudo ./entrypoint.sh $*", "--"]
