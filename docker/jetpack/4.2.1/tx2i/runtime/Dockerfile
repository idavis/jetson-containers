ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2-tx2i-jetpack-4.2.1-base

# CUDA libraries for L4T

ARG CUDA_TOOLKIT_PKG="cuda-repo-l4t-10-0-local-${CUDA_PKG_VERSION}_arm64.deb"

COPY --from=dependencies /data/${CUDA_TOOLKIT_PKG} ${CUDA_TOOLKIT_PKG}
RUN echo "0e12b2f53c7cbe4233c2da73f7d8e6b4 ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-get update && apt-get install -y --no-install-recommends cuda-libraries-10.0 && \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.326 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
