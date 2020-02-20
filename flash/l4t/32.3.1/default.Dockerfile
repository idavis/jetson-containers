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
# pre-req for Linux_for_Tegra/nv_tegra/nv-apply-debs.sh as it tries to chroot
COPY --from=qemu /usr/bin/qemu-aarch64-static /Linux_for_Tegra/nv_tegra/qemu-aarch64-static
COPY --from=qemu /usr/bin/qemu-aarch64-static /usr/bin/qemu-aarch64-static
#RUN sed -i '/.*LC_ALL=C chroot . mount -t proc none \/proc.*/c\#LC_ALL=C chroot . mount -t proc none \/proc' ./Linux_for_Tegra/nv_tegra/nv-apply-debs.sh
#RUN sed -i '/.*umount ${L4T_ROOTFS_DIR}\/proc.*/c\#umount ${L4T_ROOTFS_DIR}\/proc' ./Linux_for_Tegra/nv_tegra/nv-apply-debs.sh
RUN sed -i '/.*	LC_ALL=C chroot . dpkg -i --path-include=\"\/usr\/share\/doc\/\*\" \"${pre_deb_list\[\@\]}\".*/c\	LC_ALL=C chroot . apt install -y --no-install-recommends \"${pre_deb_list[@]}\"' ./Linux_for_Tegra/nv_tegra/nv-apply-debs.sh
RUN sed -i '/.*LC_ALL=C chroot . dpkg -i --path-include=\"\/usr\/share\/doc\/\*\" \"${deb_list\[\@\]}\".*/c\LC_ALL=C chroot . apt install -y --no-install-recommends \"${deb_list[@]}\"' ./Linux_for_Tegra/nv_tegra/nv-apply-debs.sh

WORKDIR /Linux_for_Tegra
# apply binaries must be done at flash due to chroot and --target-overlay seems to be broken
#RUN ./apply_binaries.sh --target-overlay



ARG TARGET_BOARD
ARG ROOT_DEVICE
ENV TARGET_BOARD=$TARGET_BOARD
ENV ROOT_DEVICE=$ROOT_DEVICE
RUN echo "deb http://ports.ubuntu.com/ubuntu-ports bionic universe" >> rootfs/etc/apt/sources.list
RUN echo "#!/bin/bash" >> entrypoint.sh && \
    echo "set -e" >> entrypoint.sh && \
    echo "cd rootfs" >> entrypoint.sh && \
    echo "sudo mount --bind /dev/ dev/" >> entrypoint.sh && \
    echo "sudo mount --bind /sys/ sys/" >> entrypoint.sh && \
    echo "sudo mount --bind /proc/ proc/" >> entrypoint.sh && \
    echo "sudo cp /etc/resolv.conf etc/resolv.conf.host" >> entrypoint.sh && \
    echo "sudo mv etc/resolv.conf etc/resolv.conf.saved" >> entrypoint.sh && \
    echo "sudo mv etc/resolv.conf.host etc/resolv.conf" >> entrypoint.sh && \
    echo "sudo chroot . apt update" >> entrypoint.sh && \
    echo "sudo umount ./proc" >> entrypoint.sh && \
    echo "sudo umount ./sys" >> entrypoint.sh && \
    echo "sudo umount ./dev" >> entrypoint.sh && \
    echo "cd .." >> entrypoint.sh && \
    echo "sudo ./apply_binaries.sh" >> entrypoint.sh && \
    echo "cd rootfs" >> entrypoint.sh && \
    echo "sudo rm etc/resolv.conf" >> entrypoint.sh && \
    echo "sudo mv etc/resolv.conf.saved etc/resolv.conf" >> entrypoint.sh && \
    echo "sudo rm -rf dev/*" >> entrypoint.sh && \
    echo "sudo rm -rf var/log/*" >> entrypoint.sh && \
    echo "sudo rm -rf var/tmp/*" >> entrypoint.sh && \
    echo "sudo rm -rf var/cache/apt/archives/*.deb" >> entrypoint.sh && \
    echo "sudo rm -rf tmp/*" >> entrypoint.sh && \
    echo "sudo rm -rf var/lib/apt/lists/*" >> entrypoint.sh && \
    echo "cd .." >> entrypoint.sh && \
    echo "echo \"sudo ./flash.sh \$* ${TARGET_BOARD} ${ROOT_DEVICE}\"" >> entrypoint.sh && \
    echo "sudo ./flash.sh \$* ${TARGET_BOARD} ${ROOT_DEVICE}" >> entrypoint.sh && \
    chmod +x entrypoint.sh

#ENTRYPOINT ["sh", "-c", "sudo ./entrypoint.sh $*", "--"]