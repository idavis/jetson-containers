ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
ARG TAG
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
ARG TAG
FROM ${IMAGE_NAME}:${TAG}-base as tensorflow-base

# CUDA Toolkit for L4T

# TensorFlow: cuda-cublas-10-0 cuda-cudart-10-0 cuda-cufft-10-0
#             cuda-curand-10-0 cuda-cusolver-10-0 cuda-cusparse-10-0

ARG CUDA_TOOLKIT_PKG="cuda-repo-l4t-10-0-local-${CUDA_PKG_VERSION}_arm64.deb"

COPY --from=dependencies /data/${CUDA_TOOLKIT_PKG} ${CUDA_TOOLKIT_PKG}
RUN echo "0e12b2f53c7cbe4233c2da73f7d8e6b4 ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-get update && \
    apt-get install -y --allow-downgrades \
    cuda-cublas-10-0 \
    cuda-cudart-10-0 \
    cuda-cufft-10-0 \
    cuda-curand-10-0 \
    cuda-cusolver-10-0 \
    cuda-cusparse-10-0 \
    && \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.326 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.5.0.56

ENV CUDNN_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

COPY --from=dependencies /data/libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb
RUN echo "9f30aa86e505a3b83b127ed7a51309a1 libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb
RUN echo "a010637c80859b2143ef24461ee2ef97 libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb


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

ENV OPENCV_VERSION 3.3.1

ENV OPENCV_PKG_VERSION=${OPENCV_VERSION}-2-g31ccdfe11

COPY --from=dependencies /data/libopencv_${OPENCV_PKG_VERSION}_arm64.deb libopencv_${OPENCV_PKG_VERSION}_arm64.deb
RUN echo "dd5b571c08a0098141203daec2ea1acc libopencv_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv_${OPENCV_PKG_VERSION}_arm64.deb

## Open CV python binding
COPY --from=dependencies /data/libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb
RUN echo "35776ce159afa78a0fe727d4a3c5b6fa libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb

RUN apt-get update && apt-get install -y \
    build-essential \
    libhdf5-dev \
    libhdf5-serial-dev \
    python3-dev \
    python3-h5py \
    python3-pip \
    python3-setuptools \
    && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir --upgrade setuptools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir -U numpy grpcio absl-py py-cpuinfo psutil portpicker grpcio six mock requests gast astor termcolor

# Install TensorFlow

#RUN python3 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu
# can browse from https://developer.download.nvidia.com/compute/redist/jp/
#RUN python3 -m pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==$TF_VERSION+nv$NV_VERSION

RUN python3 -m pip install --no-cache-dir --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==1.14.0+nv19.7


FROM tensorflow-base as objectdetection-builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    protobuf-compiler \
    && \
    rm -rf /var/lib/apt/lists/*

# Clone the TensorFlow Models Repository
# the release branches usually don't contain the research folder, so we have to use master.
ARG TF_MODELS_VERSION=master
RUN git clone --depth 1 https://github.com/tensorflow/models.git -b ${TF_MODELS_VERSION}

WORKDIR /models/research

# Compile the Protos

RUN protoc object_detection/protos/*.proto --python_out=.

# Build the Wheels

RUN python3 setup.py build && \
    python3 setup.py bdist_wheel && \
    (cd slim && python3 setup.py bdist_wheel)


FROM tensorflow-base as app-base

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    pkg-config \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=objectdetection-builder /models/research/dist/object_detection-0.1-py3-none-any.whl .
COPY --from=objectdetection-builder /models/research/slim/dist/slim-0.1-py3-none-any.whl .
RUN python3 -m pip install --no-cache-dir object_detection-0.1-py3-none-any.whl && \
    python3 -m pip install --no-cache-dir slim-0.1-py3-none-any.whl && \
    rm object_detection-0.1-py3-none-any.whl && \
    rm slim-0.1-py3-none-any.whl

COPY --from=objectdetection-builder /models/research/object_detection/data /data

# App dependencies

RUN apt-get update && apt-get install -y --no-install-recommends \
   libavcodec-dev \
   libavformat-dev \
   libavutil-dev \
   libeigen3-dev \
   libglew-dev \
   libtiff5-dev \
   libjpeg-dev \
   libpng-dev \
   libpostproc-dev \
   libswscale-dev \
   libtbb-dev \
   libgtk2.0-dev \
   libxvidcore-dev \
   libx264-dev \
   zlib1g-dev \
   libxml2-dev \
   libxslt1-dev \
   libcanberra-gtk-module \
   && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/*

FROM app-base

RUN mkdir app
WORKDIR /app

COPY requirements.txt ./

RUN python3 -m pip install --no-cache-dir --user -r requirements.txt

COPY app.py ./

#RUN useradd -ms /bin/bash moduleuser
#USER moduleuser

#ENTRYPOINT [ "python3", "-u", "./main.py" ]

RUN echo "#!/bin/bash" >> entrypoint.sh && \
    echo "python3 app.py \$*" >> entrypoint.sh && \
    chmod +x entrypoint.sh

#ENTRYPOINT ["sh", "-c", "./entrypoint.sh $*", "--"]
