ARG VERSION_ID
FROM arm64v8/ubuntu:${VERSION_ID}

ARG URL=https://developer.download.nvidia.com/embedded/L4T/r31_Release_v1.0/BSP

ARG DRIVER_PACK=Jetson_Linux_R31.1.0_aarch64.tbz2

# bzip2 is needed to extract the tegra driver package
RUN apt-get update && apt-get install -y \
    apt-utils \
    bzip2 \
    curl \
    sudo \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL $URL/${DRIVER_PACK} -o ${DRIVER_PACK} && \
    echo " d1d7e1fa49c0102ee705e581a188d34c *./${DRIVER_PACK}" | md5sum -c - && \
    tar -xpj --overwrite -f ./${DRIVER_PACK} && \
    sed -i '/.*tar xpfm ${LDK_NV_TEGRA_DIR}\/config\.tbz2.*/c\tar xpm --overwrite -f ${LDK_NV_TEGRA_DIR}\/config.tbz2' ./Linux_for_Tegra/apply_binaries.sh && \
    ./Linux_for_Tegra/apply_binaries.sh -r / && \
    rm -rf ./Linux_for_Tegra && \
    rm ./${DRIVER_PACK}

ENV LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:/usr/lib/aarch64-linux-gnu/tegra-egl:${LD_LIBRARY_PATH}

RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.31.0.1 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so && \
    ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.31.0.1 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.1 && \
    ln -s /usr/lib/aarch64-linux-gnu/tegra/libGL.so /usr/lib/aarch64-linux-gnu/libGL.so && \
    ln -s /usr/lib/aarch64-linux-gnu/libcuda.so /usr/lib/aarch64-linux-gnu/libcuda.so.1 && \
    ln -s /usr/lib/aarch64-linux-gnu/tegra-egl/libEGL.so /usr/lib/aarch64-linux-gnu/libEGL.so

