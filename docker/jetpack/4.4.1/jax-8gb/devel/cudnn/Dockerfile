ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.4.4-jax-8gb-jetpack-4.4.1-devel

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 8.0

LABEL com.nvidia.cudnn.version="8.0"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libcudnn8 libcudnn8-dev libcudnn8-doc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*