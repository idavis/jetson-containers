
ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-jax-jetpack-4.2-devel-cudnn

# NVIDIA VisionWorks Toolkit

COPY --from=dependencies /data/libvisionworks-repo_1.6.0.500n_arm64.deb libvisionworks-repo_1.6.0.500n_arm64.deb
RUN echo "e70d49ff115bc5782a3d07b572b5e3c0 libvisionworks-repo_1.6.0.500n_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libvisionworks-repo_1.6.0.500n_arm64.deb && \
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
    apt-get update && apt-get install -y --no-install-recommends /libvisionworks-sfm-repo_0.90.4_arm64.deb && \
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
    apt-get update && apt-get install -y --no-install-recommends /libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    apt-key add /var/visionworks-tracking-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated libvisionworks-tracking libvisionworks-tracking-dev && \
    dpkg --purge libvisionworks-tracking-repo && \
    rm libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA TensorRT
ENV LIBINFER_VERSION 5.0.6

LABEL com.nvidia.libinfer.version="${LIBINFER_VERSION}"

COPY --from=dependencies /data/libnvinfer5_5.0.6-1+cuda10.0_arm64.deb libnvinfer5_5.0.6-1+cuda10.0_arm64.deb
RUN echo "70526ede410bca53d7f6ce60e082178b libnvinfer5_5.0.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer5_5.0.6-1+cuda10.0_arm64.deb && \
    rm libnvinfer5_5.0.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb
RUN echo "376ef649841d1347e4ddfdb8b323d084 python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb && \
    rm python3-libnvinfer-dev_5.0.6-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libnvinfer-samples_5.0.6-1+cuda10.0_all.deb libnvinfer-samples_5.0.6-1+cuda10.0_all.deb
RUN echo "aa6d4a5ced259a714fe73baf4ce46061 libnvinfer-samples_5.0.6-1+cuda10.0_all.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libnvinfer-samples_5.0.6-1+cuda10.0_all.deb && \
    rm libnvinfer-samples_5.0.6-1+cuda10.0_all.deb

ENV TENSORRT_VERSION 5.0.6.3

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda10.0_arm64.deb

COPY --from=dependencies /data/tensorrt_5.0.6.3-1+cuda10.0_arm64.deb tensorrt_5.0.6.3-1+cuda10.0_arm64.deb
RUN echo "6b9f36d9fd382576605c95fe9d3e744b tensorrt_5.0.6.3-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /tensorrt_5.0.6.3-1+cuda10.0_arm64.deb && \
    rm tensorrt_5.0.6.3-1+cuda10.0_arm64.deb

# Graph Surgeon
COPY --from=dependencies /data/graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb
RUN echo "0fac7150098e3dfd921e353067e95dd3 graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb && \
    rm graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb

# UFF Converter
COPY --from=dependencies /data/uff-converter-tf_5.0.6-1+cuda10.0_arm64.deb uff-converter-tf_5.0.6-1+cuda10.0_arm64.deb
RUN echo "c1592b4bd7c56a3b5ec883e8e846d9bf uff-converter-tf_5.0.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /uff-converter-tf_5.0.6-1+cuda10.0_arm64.deb && \
    rm uff-converter-tf_5.0.6-1+cuda10.0_arm64.deb

# Multimedia API
# 6b870acbb906fc923828e110d23a096f8450fc7f  Tegra_Multimedia_API_R32.2.1_aarch64.tbz2
# Skipping unless needed.

# Install dependencies for OpenCV

# Open CV 3.3.1

COPY --from=dependencies /data/libopencv_3.3.1-2-g31ccdfe11_arm64.deb libopencv_3.3.1-2-g31ccdfe11_arm64.deb
RUN echo "dd5b571c08a0098141203daec2ea1acc libopencv_3.3.1-2-g31ccdfe11_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libopencv_3.3.1-2-g31ccdfe11_arm64.deb && \
    rm libopencv_3.3.1-2-g31ccdfe11_arm64.deb

# Open CV python binding
COPY --from=dependencies /data/libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb
RUN echo "35776ce159afa78a0fe727d4a3c5b6fa libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb && \
    rm libopencv-python_3.3.1-2-g31ccdfe11_arm64.deb

# Open CV dev
COPY --from=dependencies /data/libopencv-dev_3.3.1-2-g31ccdfe11_arm64.deb libopencv-dev_3.3.1-2-g31ccdfe11_arm64.deb
RUN echo "d29571f888a59dd290da2650dc202623 libopencv-dev_3.3.1-2-g31ccdfe11_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libopencv-dev_3.3.1-2-g31ccdfe11_arm64.deb && \
    rm libopencv-dev_3.3.1-2-g31ccdfe11_arm64.deb

# Open CV samples
COPY --from=dependencies /data/libopencv-samples_3.3.1-2-g31ccdfe11_arm64.deb libopencv-samples_3.3.1-2-g31ccdfe11_arm64.deb
RUN echo "4f28a7792425b5e1470d5aa73c2a470d libopencv-samples_3.3.1-2-g31ccdfe11_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libopencv-samples_3.3.1-2-g31ccdfe11_arm64.deb && \
    rm libopencv-samples_3.3.1-2-g31ccdfe11_arm64.deb

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
# Index URLS
# Browse https://developer.download.nvidia.com/compute/redist/jp/ for more.
# 4.4: https://developer.download.nvidia.com/compute/redist/jp/v44/tensorflow/
# 4.3 GPU: https://developer.download.nvidia.com/compute/redist/jp/v43/tensorflow-gpu/
# 4.3 CPU: https://developer.download.nvidia.com/compute/redist/jp/v43/tensorflow/
# 4.2: https://developer.download.nvidia.com/compute/redist/jp/v42/tensorflow-gpu/
# Commands:
# RUN python3 -m pip install --pre --extra-index-url ${TF_INDEX_URL} tensorflow-gpu
# RUN python3 -m pip install --extra-index-url ${TF_INDEX_URL} tensorflow-gpu==${TF_VERSION}+nv${NV_VERSION}

# Available versions:
# All available versions can be found by browsing https://developer.download.nvidia.com/compute/redist/jp/
