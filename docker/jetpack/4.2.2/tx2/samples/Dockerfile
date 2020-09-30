ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.1-tx2-jetpack-4.2.2-devel as builder


WORKDIR /usr/local/cuda-10.0/samples

RUN make -j4

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.1-tx2-jetpack-4.2.2-runtime as base

# Prereqs

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    freeglut3 \
    libegl1 \
    libx11-dev \
    libgles2-mesa \
    libgl1-mesa-glx \
    libglu1-mesa \
    libgomp1 \
    libxi-dev \
    libxmu-dev \
    openmpi-bin \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM base
RUN mkdir samples

COPY --from=builder /usr/local/cuda-10.0/samples/ /samples


WORKDIR /samples/bin/aarch64/linux/release/