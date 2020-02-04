ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.3.1-tx2i-jetpack-4.3-devel

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.6.3.28

LABEL com.nvidia.cudnn.version="7.6.3.28"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libcudnn7 libcudnn7-dev libcudnn7-doc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*