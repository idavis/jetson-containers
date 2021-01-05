ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.4.4-tx2-4gb-jetpack-4.4.1-runtime

# CUDA Toolkit for L4T

RUN apt-get update && \
    apt-get install -y --allow-downgrades --no-install-recommends cuda-toolkit-10-2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*