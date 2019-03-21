FROM arm64v8/ubuntu:bionic-20181112

ARG URL=https://developer.download.nvidia.com/embedded/L4T/r32_Release_v1.0/jetson-nano/BSP/

ARG DRIVER_PACK=Jetson-Nano-Tegra210_Linux_R32.1.0_aarch64.tbz2

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
    echo "14303c9a1dcc65b9d0d0b5ee8ea942f4d88e2304 *./${DRIVER_PACK}" | sha1sum -c --strict - && \
    tar -xpj --overwrite -f ./${DRIVER_PACK} && \
    #sed -i '/.*tar xpfm ${LDK_NV_TEGRA_DIR}\/config\.tbz2.*/c\tar xpm --overwrite -f ${LDK_NV_TEGRA_DIR}\/config.tbz2' ./Linux_for_Tegra/apply_binaries.sh && \
    ./Linux_for_Tegra/apply_binaries.sh -r / && \
    rm -rf ./Linux_for_Tegra && \
    rm ./${DRIVER_PACK}

ENV LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:/usr/lib/aarch64-linux-gnu/tegra-egl:${LD_LIBRARY_PATH}

RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.1.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.1.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.1
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-egl-wayland.so /usr/lib/aarch64-linux-gnu/tegra/libnvidia-egl-wayland.so.1
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libcuda.so /usr/lib/aarch64-linux-gnu/libcuda.so

