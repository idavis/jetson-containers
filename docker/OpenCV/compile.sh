#!/bin/bash

cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    -DCPACK_BINARY_DEB=ON \
    -DBUILD_PNG=ON \
    -DBUILD_JPEG=ON \
    -DBUILD_TIFF=ON \
    -DBUILD_TBB=ON \
    -DBUILD_JASPER=OFF \
    -DBUILD_ZLIB=OFF \
    -DBUILD_opencv_java=OFF \
    -DBUILD_opencv_python2=ON \
    -DBUILD_opencv_python3=ON \
    -DENABLE_NEON=OFF \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DWITH_OPENCL=OFF \
    -DWITH_OPENMP=OFF \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=ON \
    -DWITH_GSTREAMER_0_10=OFF \
    -DWITH_CUDA=ON \
    -DWITH_GTK=ON \
    -DWITH_QT=OFF \
    -DWITH_VTK=OFF \
    -DWITH_1394=OFF \
    -DWITH_OPENEXR=OFF \
    -DINSTALL_C_EXAMPLES=OFF \
    -DINSTALL_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_DOCS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
    -DCUDA_ARCH_BIN=$CUDA_ARCH_BIN \
    -DINSTALL_TESTS=OFF \
    -DOPENCV_TEST_DATA_PATH=../../opencv_extra/testdata \
    -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    ..

make -j$(($(nproc) - 1))
make install -j$(($(nproc) - 1))
make package -j$(($(nproc) - 1))
