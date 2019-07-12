ARG DEPENDENCIES_IMAGE
ARG VERSION_ID
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG VERSION_ID
FROM ubuntu:${VERSION_ID}

ENV JETPACK_VERSION "4.2"

LABEL com.nvidia.jetpack.version="${JETPACK_VERSION}"

ENV DRIVER_VERSION 410.62
ENV CUDA_VERSION 10.0.166

LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

# Prereqs

RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# CUDA Runtime repo

ARG CUDA_TOOLKIT_PKG="cuda-repo-ubuntu1604-10-0-local-${CUDA_VERSION}-${DRIVER_VERSION}_1.0-1_amd64.deb"
ARG CUDA_CROSS_TOOLKIT_PKG="cuda-repo-cross-aarch64-10-0-local-${CUDA_VERSION}_1.0-1_all.deb"

COPY --from=dependencies /data/${CUDA_TOOLKIT_PKG} ${CUDA_TOOLKIT_PKG}
COPY --from=dependencies /data/${CUDA_CROSS_TOOLKIT_PKG} ${CUDA_CROSS_TOOLKIT_PKG}
RUN echo "ae9eb96f288847ce993dbfc109fa4790 ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-key add /var/cuda-repo-*-local*/*.pub && \
    apt-get update && \
    apt-get install -y --allow-downgrades cuda-toolkit-10-0 \
    && \
    echo "6fb7ba26db83dabfd3cf75280e7bf23f ${CUDA_CROSS_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_CROSS_TOOLKIT_PKG} && \
    rm ${CUDA_CROSS_TOOLKIT_PKG} && \
    apt-key add /var/cuda-repo-*-local*/*.pub && \
    apt-get update && \
    apt-get install -y --allow-downgrades cuda-cross-aarch64-10-0 \
    && \
    dpkg --purge cuda-repo-ubuntu1604-10-0-local-${CUDA_VERSION}-${DRIVER_VERSION} && \
    dpkg --purge cuda-repo-cross-aarch64-10-0-local-${CUDA_VERSION} \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/local/cuda-10.0 /usr/local/cuda && \
    grep -q "export PATH=.*/usr/local/cuda-10/bin" ~/.bashrc || echo "export PATH=/usr/local/cuda-10/bin:$PATH">>~/.bashrc && \
    grep -q "export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64" ~/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc && \
    echo "export CROSS_COMPILE=l4t-gcc/${TOOLCHAIN}-" >> ~/.bashrc && \
    export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:${LD_LIBRARY_PATH}
