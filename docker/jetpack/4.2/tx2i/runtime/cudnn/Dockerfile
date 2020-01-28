ARG IMAGE_NAME
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-tx2i-jetpack-4.2-runtime

# NVIDIA CUDA Deep Neural Network library (cuDNN)
ENV CUDNN_VERSION 7.3.1.28

LABEL com.nvidia.cudnn.version="7.3.1.28"


COPY --from=dependencies /data/libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb
RUN echo "92867c0a495f84ec11d108f84b776620 libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb && \
    rm libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb
