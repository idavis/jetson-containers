#!/bin/bash

docker build --rm -f Dockerfile -t pytorch-wheel:0.4.1-l4t-28.2.1-tx2-jetpack-3.3-linux-aarch64 \
    --build-arg PYTORCH_VERSION=0.4.1 \
    --build-arg L4T_VERSION=28.2.1 \
    --build-arg DEVICE=tx2 \
    --build-arg JETPACK_VERSION=3.3 \
    .
