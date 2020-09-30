ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.4.3-jax-jetpack-4.4-base

# CUDA libraries for L4T
RUN apt-get update && apt-get install -y --no-install-recommends cuda-libraries-10.2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*