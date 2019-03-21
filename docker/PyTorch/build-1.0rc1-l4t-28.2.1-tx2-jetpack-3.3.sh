#!/bin/bash

docker build --rm -f Dockerfile -t pytorch-wheel:1.0rc1-l4t-28.2.1-tx2-jetpack-3.3-linux-aarch64 \
    --build-arg PYTORCH_VERSION=1.0rc1 \
    --build-arg L4T_VERSION=28.2.1 \
    --build-arg DEVICE=tx2 \
    --build-arg JETPACK_VERSION=3.3 \
    .
