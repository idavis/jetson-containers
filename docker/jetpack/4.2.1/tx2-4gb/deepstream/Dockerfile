ARG IMAGE_NAME
ARG DEPENDENCIES_IMAGE
FROM ${DEPENDENCIES_IMAGE} as dependencies
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.0-tx2-4gb-jetpack-4.2.1-base

# CUDA libraries for L4T

# TensorRT: cuda-cublas-dev-10-0 cuda-cudart-dev-10-0
# DeepStream: cuda-npp-dev-10-0

COPY --from=dependencies /data/cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb
RUN echo "0e12b2f53c7cbe4233c2da73f7d8e6b4 cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb" | md5sum -c - && \
    dpkg --force-all -i cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb && \
    rm cuda-repo-l4t-10-0-local-10.0.326_1.0-1_arm64.deb && \
    apt-get update && apt-get install -y --no-install-recommends --allow-downgrades cuda-cublas-dev-10-0 cuda-cudart-dev-10-0 cuda-npp-dev-10-0 && \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.326 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.5.0.56

LABEL com.nvidia.cudnn.version="7.5.0.56"

COPY --from=dependencies /data/libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb
RUN echo "9f30aa86e505a3b83b127ed7a51309a1 libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb && \
    rm libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb
RUN echo "a010637c80859b2143ef24461ee2ef97 libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb

# NVIDIA VisionWorks Toolkit

COPY --from=dependencies /data/libvisionworks-repo_1.6.0.500n_arm64.deb libvisionworks-repo_1.6.0.500n_arm64.deb
RUN echo "e70d49ff115bc5782a3d07b572b5e3c0 libvisionworks-repo_1.6.0.500n_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libvisionworks-repo_1.6.0.500n_arm64.deb && \
    apt-key add /var/visionworks-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends libvisionworks && \
    dpkg --purge libvisionworks-repo && \
    rm libvisionworks-repo_1.6.0.500n_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Plus (SFM)
COPY --from=dependencies /data/libvisionworks-sfm-repo_0.90.4_arm64.deb libvisionworks-sfm-repo_0.90.4_arm64.deb
RUN echo "647b0ae86a00745fc6d211545a9fcefe libvisionworks-sfm-repo_0.90.4_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libvisionworks-sfm-repo_0.90.4_arm64.deb && \
    apt-key add /var/visionworks-sfm-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends libvisionworks-sfm && \
    dpkg --purge libvisionworks-sfm-repo && \
    rm libvisionworks-sfm-repo_0.90.4_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Object Tracker
COPY --from=dependencies /data/libvisionworks-tracking-repo_0.88.2_arm64.deb libvisionworks-tracking-repo_0.88.2_arm64.deb
RUN echo "7630f0309c883cc6d8a1ab5a712938a5 libvisionworks-tracking-repo_0.88.2_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    apt-key add /var/visionworks-tracking-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends libvisionworks-tracking && \
    dpkg --purge libvisionworks-tracking-repo && \
    rm libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA TensorRT
ENV LIBINFER_VERSION 5.1.6

LABEL com.nvidia.libinfer.version="5.1.6"

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

LABEL com.nvidia.tensorrt.version="5.1.6.1"

COPY --from=dependencies /data/tensorrt_5.1.6.1-1+cuda10.0_arm64.deb tensorrt_5.1.6.1-1+cuda10.0_arm64.deb
RUN echo "66e6df17b7a92d32dd3465bdfca9fc8d tensorrt_5.1.6.1-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /tensorrt_5.1.6.1-1+cuda10.0_arm64.deb && \
    rm tensorrt_5.1.6.1-1+cuda10.0_arm64.deb

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

# DeepStream Dependencies

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libssl1.0.0 \
    libgstreamer1.0-0 \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    libgstrtspserver-1.0-0 \
    libjansson4 \
    libjson-glib-1.0-0 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Additional DeepStream dependencies usually installed by the CUDA Toolkit

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# DeepStream

COPY --from=dependencies /data/deepstream-4.0_4.0-1_arm64.deb deepstream-4.0_4.0-1_arm64.deb
RUN echo "c1fe98477d4aadcc78551ae41684481c deepstream-4.0_4.0-1_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /deepstream-4.0_4.0-1_arm64.deb && \
    rm deepstream-4.0_4.0-1_arm64.deb

RUN ldconfig
WORKDIR /opt/nvidia/deepstream/deepstream-4.0/samples