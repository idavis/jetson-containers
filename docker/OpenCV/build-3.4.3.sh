#!/bin/bash

sudo docker build -f Dockerfile -t opencv-install:3.4.3-l4t-28.2.1-tx2-jetpack-3.3-linux-aarch64 --build-arg OPENCV_VERSION=3.4.3 --build-arg L4T_VERSION=28.2.1 --build-arg DEVICE=tx2 --build-arg JETPACK_VERSION=3.3 .
