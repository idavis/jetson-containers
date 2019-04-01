ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-jax-jetpack-4.2-base

ARG URL

# CUDA libraries for L4T

ARG CUDA_TOOLKIT_PKG="cuda-repo-l4t-10-0-local-${CUDA_PKG_VERSION}_arm64.deb"

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    curl -sSL $URL/${CUDA_TOOLKIT_PKG} -o ${CUDA_TOOLKIT_PKG} && \
    echo "5e3eedc3707305f9022d41754d6becde ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-get update && apt-get install -y --no-install-recommends cuda-libraries-10.0 && \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.166 \
    && \
    apt-get purge --autoremove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

