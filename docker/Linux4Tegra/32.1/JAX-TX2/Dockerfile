FROM arm64v8/ubuntu:bionic-20181112

ARG URL=https://developer.download.nvidia.com/embedded/L4T/r32_Release_v1.0/jax-tx2/BSP

ARG DRIVER_PACK=JAX-TX2-Jetson_Linux_R32.1.0_aarch64.tbz2

# l/bzip2 is needed to extract the tegra driver package
RUN apt-get update && apt-get install -y \
    apt-utils \
    bzip2 \
    lbzip2 \
    curl \
    sudo \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL $URL/${DRIVER_PACK} -o ${DRIVER_PACK} && \
    echo "602fa50432d7ad7e4bc11db505b66bd01f366e85 *./${DRIVER_PACK}" | sha1sum -c --strict - && \
    tar -xpj --overwrite -f ./${DRIVER_PACK} && \
    sed -i '/.*tar -I lbzip2 -xpmf ${LDK_NV_TEGRA_DIR}\/config\.tbz2.*/c\tar -I lbzip2 -xpm --overwrite -f ${LDK_NV_TEGRA_DIR}\/config.tbz2' ./Linux_for_Tegra/apply_binaries.sh && \
    ./Linux_for_Tegra/apply_binaries.sh -r / && \
    rm -rf ./Linux_for_Tegra && \
    rm ./${DRIVER_PACK}

ENV LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:/usr/lib/aarch64-linux-gnu/tegra-egl:${LD_LIBRARY_PATH}

RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.1.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.1.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.1
RUN ln -s /usr/lib/aarch64-linux-gnu/libcuda.so /usr/lib/aarch64-linux-gnu/libcuda.so.1

