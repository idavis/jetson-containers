ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2-tx2-jetpack-4.2.1-runtime

# CUDA Toolkit for L4T

ARG CUDA_TOOLKIT_PKG="cuda-repo-l4t-10-0-local-${CUDA_PKG_VERSION}_arm64.deb"

COPY --from=dependencies /data/${CUDA_TOOLKIT_PKG} ${CUDA_TOOLKIT_PKG}
RUN echo "0e12b2f53c7cbe4233c2da73f7d8e6b4 ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-get update && \
    apt-get install -y --allow-downgrades cuda-toolkit-10-0 libgomp1 libfreeimage-dev libopenmpi-dev openmpi-bin && \
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

COPY --from=dependencies /data/libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb
RUN echo "f9e43d15ff69d65a85d2aade71a43870 libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb

# NVIDIA VisionWorks Toolkit
COPY --from=dependencies /data/libvisionworks-repo_1.6.0.500n_arm64.deb libvisionworks-repo_1.6.0.500n_arm64.deb
RUN echo "e70d49ff115bc5782a3d07b572b5e3c0 libvisionworks-repo_1.6.0.500n_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-repo_1.6.0.500n_arm64.deb && \
    apt-key add /var/visionworks-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated libvisionworks libvisionworks-dev libvisionworks-samples && \
    dpkg --purge libvisionworks-repo && \
    rm libvisionworks-repo_1.6.0.500n_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Plus (SFM)
COPY --from=dependencies /data/libvisionworks-sfm-repo_0.90.4_arm64.deb libvisionworks-sfm-repo_0.90.4_arm64.deb
RUN echo "647b0ae86a00745fc6d211545a9fcefe libvisionworks-sfm-repo_0.90.4_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-sfm-repo_0.90.4_arm64.deb && \
    apt-key add /var/visionworks-sfm-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated libvisionworks-sfm libvisionworks-sfm-dev && \
    dpkg --purge libvisionworks-sfm-repo && \
    rm libvisionworks-sfm-repo_0.90.4_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Object Tracker
COPY --from=dependencies /data/libvisionworks-tracking-repo_0.88.2_arm64.deb libvisionworks-tracking-repo_0.88.2_arm64.deb
RUN echo "7630f0309c883cc6d8a1ab5a712938a5 libvisionworks-tracking-repo_0.88.2_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    apt-key add /var/visionworks-tracking-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated libvisionworks-tracking libvisionworks-tracking-dev && \
    dpkg --purge libvisionworks-tracking-repo && \
    rm libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA TensorRT
ENV LIBINFER_VERSION 5.1.6

ENV LIBINFER_PKG_VERSION=${LIBINFER_VERSION}-1

LABEL com.nvidia.libinfer.version="${LIBINFER_VERSION}"

ENV LIBINFER_PKG libnvinfer5_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

ENV LIBINFER_DEV_PKG libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

ENV LIBINFER_SAMPLES_PKG libnvinfer-samples_${LIBINFER_PKG_VERSION}+cuda10.0_all.deb

COPY --from=dependencies /data/${LIBINFER_PKG} ${LIBINFER_PKG}
RUN echo "dca1e2dadeae2186b57a11861fac7652 ${LIBINFER_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_PKG} && \
    rm ${LIBINFER_PKG}

COPY --from=dependencies /data/${LIBINFER_DEV_PKG} ${LIBINFER_DEV_PKG}
RUN echo "0e0c0c6d427847d5994f04fbce0401d2 ${LIBINFER_DEV_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_DEV_PKG} && \
    rm ${LIBINFER_DEV_PKG}

COPY --from=dependencies /data/${LIBINFER_SAMPLES_PKG} ${LIBINFER_SAMPLES_PKG}
RUN echo "e8f021ea1fad99d99f0f551d7ea3146a ${LIBINFER_SAMPLES_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_SAMPLES_PKG} && \
    rm ${LIBINFER_SAMPLES_PKG}

ENV TENSORRT_VERSION 5.1.6.1

ENV TENSORRT_PKG_VERSION=${TENSORRT_VERSION}-1

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/${TENSORRT_PKG} ${TENSORRT_PKG}
RUN echo "66e6df17b7a92d32dd3465bdfca9fc8d ${TENSORRT_PKG}" | md5sum -c - && \
    dpkg -i ${TENSORRT_PKG} && \
    rm ${TENSORRT_PKG}

RUN apt-get update && apt-get install -y \
        python-dev \
        python-numpy \
        python-pip \
        python-py \
        python-pytest \
    && \
    python -m pip install -U pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Python2 support for TensorRT
COPY --from=dependencies /data/python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "ae1a0c1b859345df172781f3d6d5d6f9 python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "53042900339b60f8f4da17e7f8e873ea python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

RUN apt-get update && apt-get install -y \
        python3-dev \
        python3-numpy \
        python3-pip \
        python3-py \
        python3-pytest \
    && \
    python3 -m pip install -U pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Python3 support for TensorRT
COPY --from=dependencies /data/python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "0f3345fe86f29e14b056df400bdd9458 python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "a6a9e37a31ceea0981a4f2622b4cce53 python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# Graph Surgeon
COPY --from=dependencies /data/graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "5729cc195d365335991c58abd75e0c99 graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# UFF Converter
COPY --from=dependencies /data/uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "b6310b19820a8b844d36dc597d2bf835 uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# Multimedia API
# f1e70a4fb5e2d333779b28f92224b4bf Tegra_Multimedia_API_R32.2.0_aarch64.tbz2
# Skipping unless needed.

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

# Open CV 3.3.1

ENV OPENCV_VERSION 3.3.1

ENV OPENCV_PKG_VERSION=${OPENCV_VERSION}-2-g31ccdfe11

## Open CV

COPY --from=dependencies /data/libopencv_${OPENCV_PKG_VERSION}_arm64.deb libopencv_${OPENCV_PKG_VERSION}_arm64.deb
RUN echo "dd5b571c08a0098141203daec2ea1acc libopencv_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv_${OPENCV_PKG_VERSION}_arm64.deb

## Open CV python binding
COPY --from=dependencies /data/libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb
RUN echo "35776ce159afa78a0fe727d4a3c5b6fa libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb

# Open CV dev
COPY --from=dependencies /data/libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb
RUN echo "d29571f888a59dd290da2650dc202623 libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb

# Open CV samples
COPY --from=dependencies /data/libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb
RUN echo "4f28a7792425b5e1470d5aa73c2a470d libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb

# Install dependencies for TensorFlow
#RUN apt-get update && apt-get install -y \
#    hdf5-tools \
#    libhdf5-dev \
#    libhdf5-serial-dev \
#    libjpeg8-dev \
#    zip \
#    zlib1g-dev \
#    && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

#RUN python3 -m pip install -U numpy grpcio absl-py py-cpuinfo psutil portpicker grpcio six mock requests gast h5py astor termcolor

# Install TensorFlow
#RUN python3 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu
# can browse from https://developer.download.nvidia.com/compute/redist/jp/
# RUN python3 -m pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==$TF_VERSION+nv$NV_VERSION
