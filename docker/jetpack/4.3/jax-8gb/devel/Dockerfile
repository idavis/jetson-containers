ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.3.1-jax-8gb-jetpack-4.3-runtime

# CUDA Toolkit for L4T

RUN apt-get update && \
    apt-get install -y --allow-downgrades --no-install-recommends cuda-toolkit-10-0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*