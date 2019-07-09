ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-nano-jetpack-4.2-runtime

# CUDA Toolkit for L4T

ARG CUDA_TOOLKIT_PKG="cuda-repo-l4t-10-0-local-${CUDA_PKG_VERSION}_arm64.deb"

COPY --from=dependencies /data/${CUDA_TOOLKIT_PKG} ${CUDA_TOOLKIT_PKG}
RUN echo "5e3eedc3707305f9022d41754d6becde ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-get update && \
    apt-get install -y --allow-downgrades cuda-toolkit-10-0 libgomp1 libfreeimage-dev libopenmpi-dev openmpi-bin && \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.166 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.3.1.28

ENV CUDNN_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

COPY --from=dependencies /data/libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb
RUN echo "92867c0a495f84ec11d108f84b776620 libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb
RUN echo "dd0fbfa225b2374b946febc98e2cdec4 libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb
RUN echo "9478c16ceeaaca937d4d26b982e48bd1 libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
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
ENV LIBINFER_VERSION 5.0.6

ENV LIBINFER_PKG_VERSION=${LIBINFER_VERSION}-1

LABEL com.nvidia.libinfer.version="${LIBINFER_VERSION}"

ENV LIBINFER_PKG libnvinfer5_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

ENV LIBINFER_DEV_PKG libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

ENV LIBINFER_SAMPLES_PKG libnvinfer-samples_${LIBINFER_PKG_VERSION}+cuda10.0_all.deb

COPY --from=dependencies /data/${LIBINFER_PKG} ${LIBINFER_PKG}
RUN echo "b3f083e0665dc8d3d8eb61349bb275d7 ${LIBINFER_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_PKG} && \
    rm ${LIBINFER_PKG}

COPY --from=dependencies /data/${LIBINFER_DEV_PKG} ${LIBINFER_DEV_PKG}
RUN echo "9e8e0d8356ba4af730c39b35c50ae2a8 ${LIBINFER_DEV_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_DEV_PKG} && \
    rm ${LIBINFER_DEV_PKG}

COPY --from=dependencies /data/${LIBINFER_SAMPLES_PKG} ${LIBINFER_SAMPLES_PKG}
RUN echo "dfa8bee28c87ec3c08b4063b779d63ef ${LIBINFER_SAMPLES_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_SAMPLES_PKG} && \
    rm ${LIBINFER_SAMPLES_PKG}

ENV TENSORRT_VERSION 5.0.6.3

ENV TENSORRT_PKG_VERSION=${TENSORRT_VERSION}-1

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/${TENSORRT_PKG} ${TENSORRT_PKG}
RUN echo "c7a9fe100fa55f2366a52909b8f55226 ${TENSORRT_PKG}" | md5sum -c - && \
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
RUN echo "9e05650a9517824e6b20dc94ebeef03c python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "2e36bad9713b20ced5ec01e987f6395e python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

RUN apt-get update && apt-get install -y \
        python-dev \
        python-numpy \
        python3-pip \
        python-py \
        python-pytest \
    && \
    python3 -m pip install -U pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Python3 support for TensorRT
COPY --from=dependencies /data/python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "966128fdae61f5b2b753762d0dd74759 python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "98d11ff195c93e2e04c49171b9200691 python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# Graph Surgeon
COPY --from=dependencies /data/graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "336ca4f5b94d973ec751a7a12824655f graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# UFF Converter
COPY --from=dependencies /data/uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb
RUN echo "8569488be7fd0ee33f2c24f9f29e103e uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# Multimedia API
# 00979fd8a30ae5d49152d229465614e9 P3448/Tegra_Multimedia_API_R32.1.0_aarch64.tbz2
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

# Install dependencies for OpenCV dev
RUN apt-get update && apt-get install -y \
    libtbb-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
