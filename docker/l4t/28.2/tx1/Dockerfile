ARG VERSION_ID
FROM arm64v8/ubuntu:${VERSION_ID}

ARG URL=https://developer.download.nvidia.com/embedded/L4T/r28_Release_v2.0/GA/BSP

ARG DRIVER_PACK=Tegra210_Linux_R28.2.0_aarch64.tbz2

# Jetpack 3.2.1 and 3.3 use the 28.2 driver package, but use the 28.2.1 root file system by default

# bzip2 is needed to extract the tegra driver package
RUN apt-get update && apt-get install -y \
    apt-utils \
    bzip2 \
    curl \
    sudo \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL ${URL}/${DRIVER_PACK} -o ${DRIVER_PACK} && \
    echo "14de440688566f8727fe9e143bd3e6d9dbee030d *./${DRIVER_PACK}" | sha1sum -c --strict - && \
    tar xvfj ./${DRIVER_PACK} && \
    ./Linux_for_Tegra/apply_binaries.sh -r / && \
    rm -rf ./Linux_for_Tegra && \
    rm ./${DRIVER_PACK}

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/aarch64-linux-gnu/tegra
ENV PATH=/usr/local/cuda-9.0/bin:$PATH

RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.28.2.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.28.2.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.1
RUN ln -sf /usr/lib/aarch64-linux-gnu/tegra/libGL.so /usr/lib/aarch64-linux-gnu/libGL.so
RUN ln -s /usr/lib/aarch64-linux-gnu/libcuda.so /usr/lib/aarch64-linux-gnu/libcuda.so.1

RUN chown root /etc/passwd
