ARG IMAGE_NAME
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.3-tx1-jetpack-4.2.3-base as tensorflow-base
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
# CUDA Toolkit for L4T# TensorFlow: cuda-cublas-10-0 cuda-cudart-10-0 cuda-cufft-10-0
#             cuda-curand-10-0 cuda-cusolver-10-0 cuda-cusparse-10-0

COPY --from=dependencies /data/cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb
RUN echo "0e12b2f53c7cbe4233c2da73f7d8e6b4 cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb" | md5sum -c - && \
    dpkg --force-all -i cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb && \
    rm cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb && \
    apt-key add /var/cuda-repo-*-local*/*.pub && \
    apt-get update && \
    apt-get install -y --allow-downgrades \
    cuda-cublas-10-0 \
    cuda-cudart-10-0 \
    cuda-cufft-10-0 \
    cuda-curand-10-0 \
    cuda-cusolver-10-0 \
    cuda-cusparse-10-0 \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.326 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*



# Install dependencies for OpenCV

RUN apt-get update && apt-get install -y --no-install-recommends \
    libavcodec-extra57 \
    libavformat57 \
    libavutil55 \
    libcairo2 \
    libgtk2.0-0 \
    libswscale4 \
    libtbb2 \
    libtbb-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

## Additional OpenCV dependencies usually installed by the CUDA Toolkit

RUN apt-get update && \
    apt-get install -y \
    libgstreamer1.0-0 \
    libgstreamer-plugins-base1.0-0 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Open CV 3.3.1



COPY --from=dependencies /data/libopencv_3.3.1-2-g31ccdfe11_arm64.deb libopencv_3.3.1-2-g31ccdfe11_arm64.deb
RUN echo "dd5b571c08a0098141203daec2ea1acc libopencv_3.3.1-2-g31ccdfe11_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libopencv_3.3.1-2-g31ccdfe11_arm64.deb && \
    rm libopencv_3.3.1-2-g31ccdfe11_arm64.deb

COPY --from=dependencies /data/libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb
RUN echo "35776ce159afa78a0fe727d4a3c5b6fa libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb && \
    rm libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb

FROM tensorflow-base as wheelhouse

ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION

RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    python3-pip \
    python3-setuptools \
    && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir --upgrade setuptools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Pillow requirements
# requires setuptools but handled above
RUN apt-get update && apt-get install -y \
    libjpeg-dev \
    libopenjp2-7-dev \
    libtiff5-dev \
    zlib1g-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# are these needed?
RUN apt-get update && apt-get install -y \
    libhdf5-dev \
    libhdf5-serial-dev \
    python3-h5py \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install wheel  
RUN mkdir /wheelhouse
ENV PIP_WHEEL_DIR=/wheelhouse
ENV WHEELHOUSE=/wheelhouse
ENV PIP_FIND_LINKS=/wheelhouse

RUN python3 -m pip wheel Cython
RUN python3 -m pip wheel contextlib2
RUN python3 -m pip wheel numpy
RUN python3 -m pip wheel matplotlib
RUN python3 -m pip wheel Pillow
RUN python3 -m pip wheel grpcio
RUN python3 -m pip wheel absl-py
RUN python3 -m pip wheel py-cpuinfo
RUN python3 -m pip wheel psutil
RUN python3 -m pip wheel portpicker
RUN python3 -m pip wheel six
RUN python3 -m pip wheel mock
RUN python3 -m pip wheel requests
RUN python3 -m pip wheel gast
RUN python3 -m pip wheel astor
RUN python3 -m pip wheel term

FROM tensorflow-base as app
COPY --from=base /wheelhouse /wheelhouse/
RUN ls -1 -d /wheelhouse/*.whl | xargs python3 -m pip install --no-cache-dir && \
    rm -rf /wheelhouse

# TODO Add TF VERSION argument and generate make targets for each.

ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION

# Install TensorFlow

# can browse from https://developer.download.nvidia.com/compute/redist/jp/
RUN python3 -m pip install --extra-index-url ${INDEX_URL} ${TF_PACKGAGE}==${TF_VERSION}+nv${NV_VERSION}
