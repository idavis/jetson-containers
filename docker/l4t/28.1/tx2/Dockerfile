ARG VERSION_ID
FROM arm64v8/ubuntu:${VERSION_ID}

ARG URL=https://developer.download.nvidia.com/embedded/L4T/r28_Release_v1.0/BSP

ARG DRIVER_PACK=Tegra186_Linux_R28.1.0_aarch64.tbz2

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
    echo "e7508c4fa0a2e1c73ce9ac671d38ea32804912d5 *./${DRIVER_PACK}" | sha1sum -c --strict - && \
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
