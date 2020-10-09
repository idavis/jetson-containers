ARG IMAGE_NAME
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.3-tx2-4gb-jetpack-4.2.3-runtime-cudnn as tensorflow-base
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
RUN echo "dca1e2dadeae2186b57a11861fac7652 libnvinfer5_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer5_5.1.6-1+cuda10.0_arm64.deb && \
    rm libnvinfer5_5.1.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb
RUN echo "0e0c0c6d427847d5994f04fbce0401d2 libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb && \
    rm libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libnvinfer-samples_5.1.6-1+cuda10.0_all.deb libnvinfer-samples_5.1.6-1+cuda10.0_all.deb
RUN echo "e8f021ea1fad99d99f0f551d7ea3146a libnvinfer-samples_5.1.6-1+cuda10.0_all.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer-samples_5.1.6-1+cuda10.0_all.deb && \
    rm libnvinfer-samples_5.1.6-1+cuda10.0_all.deb

ENV TENSORRT_VERSION 5.1.6.1

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/tensorrt_5.1.6.1-1+cuda10.0_arm64.deb tensorrt_5.1.6.1-1+cuda10.0_arm64.deb
RUN echo "66e6df17b7a92d32dd3465bdfca9fc8d tensorrt_5.1.6.1-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /tensorrt_5.1.6.1-1+cuda10.0_arm64.deb && \
    rm tensorrt_5.1.6.1-1+cuda10.0_arm64.deb

# Python2 support for TensorRT
COPY --from=dependencies /data/python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb
RUN echo "ae1a0c1b859345df172781f3d6d5d6f9 python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb && \
    rm python-libnvinfer_5.1.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb
RUN echo "53042900339b60f8f4da17e7f8e873ea python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb && \
    rm python-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb

# Python3 support for TensorRT
COPY --from=dependencies /data/python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb
RUN echo "0f3345fe86f29e14b056df400bdd9458 python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb && \
    rm python3-libnvinfer_5.1.6-1+cuda10.0_arm64.deb

# Graph Surgeon
COPY --from=dependencies /data/graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb
RUN echo "5729cc195d365335991c58abd75e0c99 graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb && \
    rm graphsurgeon-tf_5.1.6-1+cuda10.0_arm64.deb

# UFF Converter
COPY --from=dependencies /data/uff-converter-tf_5.1.6-1+cuda10.0_arm64.deb uff-converter-tf_5.1.6-1+cuda10.0_arm64.deb
RUN echo "b6310b19820a8b844d36dc597d2bf835 uff-converter-tf_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
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