
ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-nano-dev-jetpack-4.2-runtime

# CUDA Toolkit for L4T

COPY --from=dependencies /data/cuda-repo-l4t-10-0-local-10.0.166_1.0-1_arm64.deb cuda-repo-l4t-10-0-local-10.0.166_1.0-1_arm64.deb
RUN echo "5e3eedc3707305f9022d41754d6becde cuda-repo-l4t-10-0-local-10.0.166_1.0-1_arm64.deb" | md5sum -c - && \
    dpkg --force-all -i cuda-repo-l4t-10-0-local-10.0.166_1.0-1_arm64.deb && \
    rm cuda-repo-l4t-10-0-local-10.0.166_1.0-1_arm64.deb && \
    apt-get update && \
    apt-get install -y --allow-downgrades --no-install-recommends cuda-toolkit-10-0 && \
    dpkg --purge cuda-repo-l4t-10-0-local-10.0.166 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.3.1.28

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

COPY --from=dependencies /data/libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb
RUN echo "92867c0a495f84ec11d108f84b776620 libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb && \
    rm libcudnn7_7.3.1.28-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb
RUN echo "dd0fbfa225b2374b946febc98e2cdec4 libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_7.3.1.28-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb
RUN echo "9478c16ceeaaca937d4d26b982e48bd1 libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb && \
    rm libcudnn7-doc_7.3.1.28-1+cuda10.0_arm64.deb

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

# Graph Surgeon
COPY --from=dependencies /data/graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb
RUN echo "336ca4f5b94d973ec751a7a12824655f graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb && \
    rm graphsurgeon-tf_5.0.6-1+cuda10.0_arm64.deb

# UFF Converter
COPY --from=dependencies /data/uff-converter-tf_5.0.6-1+cuda10.0_arm64.deb uff-converter-tf_5.0.6-1+cuda10.0_arm64.deb
RUN echo "8569488be7fd0ee33f2c24f9f29e103e uff-converter-tf_5.0.6-1+cuda10.0_arm64.deb" | md5sum -c - && \
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
#RUN python3 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu
# can browse from https://developer.download.nvidia.com/compute/redist/jp/
# RUN python3 -m pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==$TF_VERSION+nv$NV_VERSION
