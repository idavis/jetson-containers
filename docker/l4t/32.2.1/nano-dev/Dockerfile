ARG VERSION_ID
ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG VERSION_ID
# using a smaller image doesn't save us any space as the layers are used by the other images.
FROM ubuntu:${VERSION_ID} as qemu

# install qemu for the support of building containers on host
RUN apt-get update && apt-get install -y --no-install-recommends qemu-user-static && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# start of the real image base
ARG VERSION_ID
FROM arm64v8/ubuntu:${VERSION_ID}

LABEL maintainer "Ian Davis"

# TODO: Set up conditional QEMU support for those that haven't configured binfmt.service.
# This is small overhead (3-4 MiB) and helps people fall into the pit of success.
COPY --from=qemu /usr/bin/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    lbzip2 \
    sudo

# Copy the driver pack and verify
ARG DEPENDENCIES_IMAGE
COPY --from=dependencies /data/Jetson-210_Linux_R32.2.1_aarch64.tbz2 Jetson-210_Linux_R32.2.1_aarch64.tbz2
RUN echo "e5b613bb7638863beb47c3e8ff6a2066 *./Jetson-210_Linux_R32.2.1_aarch64.tbz2" | md5sum -c -
RUN tar -xpj --overwrite -f ./Jetson-210_Linux_R32.2.1_aarch64.tbz2
RUN sed -i '/.*tar -I lbzip2 -xpmf ${LDK_NV_TEGRA_DIR}\/config\.tbz2.*/c\tar -I lbzip2 -xpm --overwrite -f ${LDK_NV_TEGRA_DIR}\/config.tbz2' ./Linux_for_Tegra/apply_binaries.sh
RUN ./Linux_for_Tegra/apply_binaries.sh -r /


# Cleanup so --squash will be effective
RUN rm -rf ./Linux_for_Tegra && \
    rm ./Jetson-210_Linux_R32.2.1_aarch64.tbz2 \
    && \
    apt-get purge --autoremove -y bzip2 lbzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:/usr/lib/aarch64-linux-gnu/tegra-egl:${LD_LIBRARY_PATH}

RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.2.1 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.2.1 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.1
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libGL.so /usr/lib/aarch64-linux-gnu/libGL.so
RUN ln -s /usr/lib/aarch64-linux-gnu/libcuda.so /usr/lib/aarch64-linux-gnu/libcuda.so.1
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra-egl/libEGL.so /usr/lib/aarch64-linux-gnu/libEGL.so
RUN ldconfig