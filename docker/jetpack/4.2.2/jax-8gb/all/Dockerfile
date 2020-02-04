
ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.1-jax-8gb-jetpack-4.2.2-devel-cudnn

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

COPY --from=dependencies /data/python3-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb python3-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb
RUN echo "1b703b6ab7a477b24ac9e90e64945799 python3-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /python3-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb && \
    rm python3-libnvinfer-dev_5.1.6-1+cuda10.0_arm64.deb

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


# Available versions:
# tensorflow_gpu-1.13.1+nv19.4-cp36-cp36m-linux_aarch64.whl 195MB
# tensorflow_gpu-1.13.1+nv19.5-cp36-cp36m-linux_aarch64.whl 195MB
# tensorflow_gpu-1.14.0+nv19.7-cp36-cp36m-linux_aarch64.whl 214MB
# tensorflow_gpu-1.14.0+nv19.9-cp36-cp36m-linux_aarch64.whl 214MB
# tensorflow_gpu-1.14.0+nv19.10-cp36-cp36m-linux_aarch64.whl 214MB
# tensorflow_gpu-1.15.0+nv19.11-cp36-cp36m-linux_aarch64.whl 217MB
# tensorflow_gpu-2.0.0+nv19.11-cp36-cp36m-linux_aarch64.whl 198MB

# Install TensorFlow
# RUN python3 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu
# can browse from https://developer.download.nvidia.com/compute/redist/jp/
# RUN python3 -m pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==${TF_VERSION}+nv${NV_VERSION}
