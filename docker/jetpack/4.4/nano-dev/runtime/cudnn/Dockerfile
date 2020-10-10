ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.4.3-nano-dev-jetpack-4.4-runtime

# NVIDIA CUDA Deep Neural Network library (cuDNN)
ENV CUDNN_VERSION 8.0

LABEL com.nvidia.cudnn.version="8.0"


RUN apt-get update && \
    apt-get install -y --no-install-recommends libcudnn8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*