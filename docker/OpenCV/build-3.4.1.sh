#!/bin/bash

docker build -f Dockerfile -t opencv-install:3.4.1-l4t-28.2.1-tx2-jetpack-3.3-linux-aarch64 --build-arg OPENCV_GIT_VERSION=3.4.1 --build-arg L4T_VERSION=28.2.1 --build-arg DEVICE=tx2 --build-arg JETPACK_VERSION=3.3 .
