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

RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    lbzip2 \
    sudo

# Copy the driver pack and verify
ARG DEPENDENCIES_IMAGE
COPY --from=dependencies /data/Jetson_Linux_R32.1.0_aarch64.tbz2 Jetson_Linux_R32.1.0_aarch64.tbz2
RUN echo "881fedee06a7446953a064b574227980 *./Jetson_Linux_R32.1.0_aarch64.tbz2" | md5sum -c -
RUN tar -xpj --overwrite -f ./Jetson_Linux_R32.1.0_aarch64.tbz2

#if jp > 4.2, since 4.2 isn't supported yet, we'll do this always
RUN sed -i '/.*tar -I lbzip2 -xpmf ${LDK_NV_TEGRA_DIR}\/config\.tbz2.*/c\tar -I lbzip2 -xpm --overwrite -f ${LDK_NV_TEGRA_DIR}\/config.tbz2' ./Linux_for_Tegra/apply_binaries.sh

# In 32.3.1, this will use deb packages instead of the archive overlay
RUN ./Linux_for_Tegra/apply_binaries.sh -r /

# Cleanup so --squash will be effective
RUN rm -rf ./Linux_for_Tegra && \
    rm ./Jetson_Linux_R32.1.0_aarch64.tbz2 \
    && \
    apt-get purge --autoremove -y bzip2 lbzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:/usr/lib/aarch64-linux-gnu/tegra-egl:${LD_LIBRARY_PATH}

RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.1 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.1 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.1
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libGL.so /usr/lib/aarch64-linux-gnu/libGL.so
RUN ln -s /usr/lib/aarch64-linux-gnu/libcuda.so /usr/lib/aarch64-linux-gnu/libcuda.so.1
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra-egl/libEGL.so /usr/lib/aarch64-linux-gnu/libEGL.so
RUN ldconfig