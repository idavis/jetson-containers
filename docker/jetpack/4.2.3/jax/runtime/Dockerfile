ARG IMAGE_NAME
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.3-jax-jetpack-4.2.3-base

# CUDA libraries for L4T
COPY --from=dependencies /data/cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb
RUN echo "0e12b2f53c7cbe4233c2da73f7d8e6b4 cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb" | md5sum -c - && \
    dpkg --force-all -i cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb && \
    rm cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb && \
    apt-get update && apt-get install -y --no-install-recommends cuda-libraries-10.0 && \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.326 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*