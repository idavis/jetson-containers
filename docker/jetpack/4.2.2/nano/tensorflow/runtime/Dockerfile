ARG IMAGE_NAME
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.1-nano-jetpack-4.2.2-runtime as tensorflow-base
ARG INDEX_URL
ARG TF_PACKGAGE
ARG TF_VERSION
ARG NV_VERSION

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