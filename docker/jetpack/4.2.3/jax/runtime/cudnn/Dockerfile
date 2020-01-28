ARG IMAGE_NAME
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.3-jax-jetpack-4.2.3-runtime

# NVIDIA CUDA Deep Neural Network library (cuDNN)
ENV CUDNN_VERSION 7.5.0.56

LABEL com.nvidia.cudnn.version="7.5.0.56"


COPY --from=dependencies /data/libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb
RUN echo "9f30aa86e505a3b83b127ed7a51309a1 libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb && \
    rm libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb
