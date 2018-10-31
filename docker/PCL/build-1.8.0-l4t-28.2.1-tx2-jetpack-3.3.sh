#!/bin/bash

sudo docker build -f Dockerfile -t pcl-deb:1.8.0-l4t-28.2.1-tx2-jetpack-3.3 \
    --build-arg PCL_VERSION=1.8.0 \
    --build-arg L4T_VERSION=28.2.1 \
    --build-arg DEVICE=tx2 \
    --build-arg JETPACK_VERSION=3.3 \
    .
