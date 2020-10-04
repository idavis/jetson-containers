ARG IMAGE_NAME
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
FROM ${IMAGE_NAME}:32.3.1-nano-jetpack-4.3-base as tensorflow-base
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
# CUDA Toolkit for L4T

# TensorFlow: cuda-cublas-10-0 cuda-cudart-10-0 cuda-cufft-10-0
#             cuda-curand-10-0 cuda-cusolver-10-0 cuda-cusparse-10-0

RUN apt-get update && \
    apt-get install -y --no-install-recommends --allow-downgrades \
    cuda-cublas-10-0 \
    cuda-cudart-10-0 \
    cuda-cufft-10-0 \
    cuda-curand-10-0 \
    cuda-cusolver-10-0 \
    cuda-cusparse-10-0 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*




RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip \
    python3-setuptools \
    && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir --upgrade setuptools && \
    python3 -m pip install --no-cache-dir --upgrade wheel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    libhdf5-dev \
    libhdf5-serial-dev \
    python3-h5py \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM tensorflow-base as wheelhouse

ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Pillow requirements
# requires setuptools but handled above
RUN apt-get update && apt-get install -y --no-install-recommends \
    libjpeg-dev \
    libopenjp2-7-dev \
    libtiff5-dev \
    zlib1g-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# TODO: are these needed?
RUN apt-get update && apt-get install -y --no-install-recommends \
    hdf5-tools \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
COPY --from=wheelhouse /wheelhouse /wheelhouse/
RUN ls -1 -d /wheelhouse/*.whl | xargs python3 -m pip install --no-cache-dir && \
    rm -rf /wheelhouse

ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION

# Install TensorFlow

# can browse from https://developer.download.nvidia.com/compute/redist/jp/
RUN python3 -m pip install --extra-index-url ${INDEX_URL} ${TF_PACKGAGE}==${TF_VERSION}+nv${NV_VERSION}
