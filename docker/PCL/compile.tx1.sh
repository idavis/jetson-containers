#!/bin/bash

cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCUDA_ARCH_BIN=5.3 \
    ..

NUM_CPU=$(nproc)
make -j$(($NUM_CPU - 1)) VERBOSE=1 package
