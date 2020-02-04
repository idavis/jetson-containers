ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.3.1-tx1-jetpack-4.3-runtime

# NVIDIA CUDA Deep Neural Network library (cuDNN)
ENV CUDNN_VERSION 7.6.3.28

LABEL com.nvidia.cudnn.version="7.6.3.28"


RUN apt-get update && \
    apt-get install -y --no-install-recommends libcudnn7 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*