ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.3.1-tx2i-jetpack-4.3-base

# DeepStream

RUN apt-get update && apt-get install -y --no-install-recommends deepstream-4.0=4.0.2-1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ldconfig
WORKDIR /opt/nvidia/deepstream/deepstream-4.0/samples