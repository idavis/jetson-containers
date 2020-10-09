ARG IMAGE_NAME
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.1-jax-8gb-jetpack-4.2.2-runtime-cudnn as tensorflow-base
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION



COPY --from=dependencies /data/cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb
RUN echo "0e12b2f53c7cbe4233c2da73f7d8e6b4 cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb" | md5sum -c - && \
    dpkg --force-all -i cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb && \
    rm cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb && \
    apt-get update && \
    apt-get install -y --allow-downgrades \
    cuda-cublas-dev-10-0 \
    cuda-cudart-dev-10-0 \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.326 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=dependencies /data/libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb
RUN echo "a010637c80859b2143ef24461ee2ef97 libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb

# NVIDIA TensorRT
ENV LIBINFER_VERSION 5.1.6

LABEL com.nvidia.libinfer.version="${LIBINFER_VERSION}"

COPY --from=dependencies /data/libnvinfer5_5.1.6-1+cuda10.0_arm64.deb libnvinfer5_5.1.6-1+cuda10.0_arm64.deb
RUN echo "9da0093178ae3dde92942e74274e8e3a libnvinfer5_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer5_5.1.6-1+cuda10.0_arm64.deb && \
    rm libnvinfer5_5.1.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb
RUN echo "1a580a0b8b1aad0a497c722fbd4e77c2 libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb && \
    rm libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libnvinfer-samples_5.1.6-1+cuda10.0_all.deb libnvinfer-samples_5.1.6-1+cuda10.0_all.deb
RUN echo "c8cc2db854381b7f92a5e7604da66e36 libnvinfer-samples_5.1.6-1+cuda10.0_all.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer-samples_5.1.6-1+cuda10.0_all.deb && \
    rm libnvinfer-samples_5.1.6-1+cuda10.0_all.deb

ENV TENSORRT_VERSION 5.1.6.1

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/tensorrt_5.1.6.1-1+cuda10.0_arm64.deb tensorrt_5.1.6.1-1+cuda10.0_arm64.deb
RUN echo "9fbd6ca009cdf96391e2572f1d9ee773 tensorrt_5.1.6.1-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /tensorrt_5.1.6.1-1+cuda10.0_arm64.deb && \
    rm tensorrt_5.1.6.1-1+cuda10.0_arm64.deb

# Python2 support for TensorRT
COPY --from=dependencies /data/python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb
RUN echo "05f07c96421bb1bfc828c1dd3bcf5fad python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb && \
    rm python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb
RUN echo "35febdc63ec98a92ce1695bb10a2b5e8 python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb && \
    rm python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb

# Python3 support for TensorRT
COPY --from=dependencies /data/python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb
RUN echo "88104606e76544cac8d79b4288372f0e python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb && \
    rm python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb

# Graph Surgeon
COPY --from=dependencies /data/graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb
RUN echo "c88082e2cc9fa71e24c560b26e6f5a5b graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb && \
    rm graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb

# UFF Converter
COPY --from=dependencies /data/uff-converter-tf_5.1.6-1+cuda10.0_arm64.deb uff-converter-tf_5.1.6-1+cuda10.0_arm64.deb
RUN echo "7eddfa1cba81da4a96a5014cdc9198e1 uff-converter-tf_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /uff-converter-tf_5.1.6-1+cuda10.0_arm64.deb && \
    rm uff-converter-tf_5.1.6-1+cuda10.0_arm64.deb

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