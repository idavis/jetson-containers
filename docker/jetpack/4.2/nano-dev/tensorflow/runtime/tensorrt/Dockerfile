ARG IMAGE_NAME
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-nano-dev-jetpack-4.2-runtime-cudnn as tensorflow-base
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION



# NVIDIA TensorRT
ENV LIBINFER_VERSION 5.0.6

LABEL com.nvidia.libinfer.version="${LIBINFER_VERSION}"

COPY --from=dependencies /data/libnvinfer5_5.0.6-1+cuda10.0_arm64.deb libnvinfer5_5.0.6-1+cuda10.0_arm64.deb
RUN echo "b3f083e0665dc8d3d8eb61349bb275d7 libnvinfer5_5.0.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer5_5.0.6-1+cuda10.0_arm64.deb && \
    rm libnvinfer5_5.0.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb
RUN echo "98d11ff195c93e2e04c49171b9200691 python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb && \
    rm python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libnvinfer-samples_5.0.6-1+cuda10.0_all.deb libnvinfer-samples_5.0.6-1+cuda10.0_all.deb
RUN echo "dfa8bee28c87ec3c08b4063b779d63ef libnvinfer-samples_5.0.6-1+cuda10.0_all.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer-samples_5.0.6-1+cuda10.0_all.deb && \
    rm libnvinfer-samples_5.0.6-1+cuda10.0_all.deb

ENV TENSORRT_VERSION 5.0.6.3

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/tensorrt_5.0.6.3-1+cuda10.0_arm64.deb tensorrt_5.0.6.3-1+cuda10.0_arm64.deb
RUN echo "c7a9fe100fa55f2366a52909b8f55226 tensorrt_5.0.6.3-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /tensorrt_5.0.6.3-1+cuda10.0_arm64.deb && \
    rm tensorrt_5.0.6.3-1+cuda10.0_arm64.deb

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