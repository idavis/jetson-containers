ARG VERSION_ID
FROM arm64v8/ubuntu:${VERSION_ID}

ARG URL=https://developer.download.nvidia.com/embedded/L4T/r32_Release_v1.0/jax-tx2/BSP

ARG DRIVER_PACK=JAX-TX2-Jetson_Linux_R32.1.0_aarch64.tbz2

ARG BSP_URL=http://www.connecttech.com/ftp/Drivers
ARG BSP=CTI-L4T-V203.tgz

RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    ca-certificates \
    curl \
    lbzip2 \
    sudo \
    && \
    curl -sSL $URL/${DRIVER_PACK} -o ${DRIVER_PACK} && \
    echo "602fa50432d7ad7e4bc11db505b66bd01f366e85 *./${DRIVER_PACK}" | sha1sum -c --strict - && \
    tar -xpj --overwrite -f ./${DRIVER_PACK} && \
    sed -i '/.*tar -I lbzip2 -xpmf ${LDK_NV_TEGRA_DIR}\/config\.tbz2.*/c\tar -I lbzip2 -xpm --overwrite -f ${LDK_NV_TEGRA_DIR}\/config.tbz2' ./Linux_for_Tegra/apply_binaries.sh && \
    cd /Linux_for_Tegra && \
    curl -sSL ${BSP_URL}/${BSP} -o ${BSP} && \
    echo "ae85bfc9816287ea20efff597af923f62c70a562 *./${BSP}" | sha1sum -c --strict - && \
    tar -xzf ${BSP} && \
    cd ./CTI-L4T && \
    LDK_ROOTFS_DIR=/ && \
    sudo ./install.sh && \
    cd ../.. && \
    rm -rf ./Linux_for_Tegra && \
    rm ./${DRIVER_PACK} \
    && \
    apt-get purge --autoremove -y bzip2 curl lbzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:/usr/lib/aarch64-linux-gnu/tegra-egl:${LD_LIBRARY_PATH}

RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.1.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.32.1.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.1
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libGL.so /usr/lib/aarch64-linux-gnu/libGL.so
RUN ln -s /usr/lib/aarch64-linux-gnu/libcuda.so /usr/lib/aarch64-linux-gnu/libcuda.so.1
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra-egl/libEGL.so /usr/lib/aarch64-linux-gnu/libEGL.so

