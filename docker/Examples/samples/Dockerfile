ARG L4T_VERSION=31.1
ARG DEVICE=xavier

FROM l4t:${L4T_VERSION}-${DEVICE}

RUN mkdir samples
COPY --from=builder /usr/local/cuda-10.0/samples/bin/aarch64/linux/release/* /samples/
COPY --from=builder /usr/local/cuda-10.0/samples/bin/aarch64/linux/release/*.* /samples/
WORKDIR /samples

ENV JETPACK_VERSION "4.1.1"

LABEL com.nvidia.jetpack.version="${JETPACK_VERSION}"

ARG URL=https://developer.download.nvidia.com/devzone/devcenter/mobile/jetpack_l4t/4.1.1/xddsn.im/JetPackL4T_4.1.1_b57

ENV CUDA_VERSION 10.0.117_1.0

ENV CUDA_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

# Prereqs

RUN apt-get update && \
    apt-get install -y gnupg2 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# CUDA Toolkit package repository for L4T

ARG CUDA_TOOLKIT_PKG "cuda-repo-l4t-10-0-local-${CUDA_PKG_VERSION}_arm64.deb"
ARG CUDA_TOOLKIT_PKG_SHA "82616939c933a7aa33a073bbaf029f42"

RUN curl -sL $URL/${CUDA_TOOLKIT_PKG} -o ${CUDA_TOOLKIT_PKG} && \
    echo "${CUDA_TOOLKIT_PKG_SHA} ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-key add /var/cuda-repo-*-local*/*.pub

# CUDA Runtime

RUN apt-get update && \
    apt-get install -y --allow-downgrades cuda-cudart-10-0 cuda-nvtx-10-0 libgomp1 libfreeimage-dev libopenmpi-dev openmpi-bin \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN grep -q "export PATH=.*/usr/local/cuda-10/bin" ~/.bashrc || echo "export PATH=/usr/local/cuda-10/bin:$PATH">>~/.bashrc && \
    grep -q "export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64" ~/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc && \
    export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:${LD_LIBRARY_PATH}
RUN rm /var/cuda-repo-*-local*/*.*

