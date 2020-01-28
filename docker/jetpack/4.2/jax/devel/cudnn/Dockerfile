
ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-jax-jetpack-4.2-devel

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.3.1.28

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

COPY --from=dependencies /data/libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb
RUN echo "92867c0a495f84ec11d108f84b776620 libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb && \
    rm libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb
RUN echo "dd0fbfa225b2374b946febc98e2cdec4 libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb
RUN echo "9478c16ceeaaca937d4d26b982e48bd1 libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb && \
    rm libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb