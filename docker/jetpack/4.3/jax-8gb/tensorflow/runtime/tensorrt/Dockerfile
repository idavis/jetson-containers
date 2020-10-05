ARG IMAGE_NAME
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
FROM ${IMAGE_NAME}:32.3.1-jax-8gb-jetpack-4.3-runtime-cudnn as tensorflow-base
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION

# NVIDIA TensorRT


LABEL com.nvidia.libinfer.version="6.0.1"

RUN apt-get update && \
apt-get install -y --no-install-recommends libnvinfer6 && \
apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvinfer-bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
apt-get install -y --no-install-recommends libnvinfer-plugin6 && \
apt-get clean && \
    rm -rf /var/lib/apt/lists/*


LABEL com.nvidia.tensorrt.version="6.0.1.10"

RUN apt-get update && \
    apt-get install -y --no-install-recommends tensorrt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
apt-get install -y --no-install-recommends libnvparsers6 && \
apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
apt-get install -y --no-install-recommends libnvonnxparsers6 && \
apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends python-libnvinfer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-libnvinfer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Graph Surgeon

RUN apt-get update && \
    apt-get install -y --no-install-recommends graphsurgeon-tf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# UFF Converter

RUN apt-get update && \
    apt-get install -y --no-install-recommends uff-converter-tf && \
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
    gfortran \
    hdf5-tools \
    libblas-dev \
    liblapack-dev \
    pkg-config \
    python3-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /wheelhouse
ENV PIP_WHEEL_DIR=/wheelhouse
ENV WHEELHOUSE=/wheelhouse
ENV PIP_FIND_LINKS=/wheelhouse

RUN python3 -m pip wheel --extra-index-url ${INDEX_URL} ${TF_PACKGAGE}==${TF_VERSION}+nv${NV_VERSION}

FROM tensorflow-base
COPY --from=wheelhouse /wheelhouse /wheelhouse/
RUN ls -1 -d /wheelhouse/*.whl | xargs python3 -m pip install --no-cache-dir && \
    rm -rf /wheelhouse