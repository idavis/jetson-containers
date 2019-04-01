ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-jax-jetpack-4.2-devel as builder

WORKDIR /usr/local/cuda-10.0/samples
RUN make -j$($(nproc) - 1)

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-jax-jetpack-4.2-runtime

# Prereqs

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    freeglut3 \
    libegl1 \
    libgles2-mesa \
    libglu1-mesa \
    libgomp1 \
    openmpi-bin \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir samples
COPY --from=builder /usr/local/cuda-10.0/samples/ /samples
WORKDIR /samples/bin/aarch64/linux/release/

