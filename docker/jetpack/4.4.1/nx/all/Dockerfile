ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.4.4-nx-jetpack-4.4.1-devel-cudnn

# NVIDIA VisionWorks Toolkit

RUN apt-get update && \
    apt-get install -y --no-install-recommends libvisionworks libvisionworks-dev libvisionworks-samples && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Plus (SFM)
RUN apt-get update && \
    apt-get install -y --no-install-recommends libvisionworks-sfm libvisionworks-sfm-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Object Tracker
RUN apt-get update && \
    apt-get install -y --no-install-recommends libvisionworks-tracking libvisionworks-tracking-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# NVIDIA TensorRT


LABEL com.nvidia.libinfer.version="7.1.3"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvinfer7 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvinfer-bin libnvinfer-dev libnvinfer-doc libnvinfer-samples && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvinfer-plugin-dev libnvinfer-plugin7 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


LABEL com.nvidia.tensorrt.version="7.1.3.0"

RUN apt-get update && \
    apt-get install -y --no-install-recommends tensorrt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvparsers7 libnvparsers-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvonnxparsers7 libnvonnxparsers-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends python-libnvinfer python-libnvinfer-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-libnvinfer python3-libnvinfer-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Graph Surgeon

RUN apt-get update && \
    apt-get install -y --no-install-recommends graphsurgeon-tf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# UFF Converter

RUN apt-get update && \
    apt-get install -y --no-install-recommends uff-converter-tf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Multimedia API

RUN apt-get update && \
    apt-get install -y --no-install-recommends nvidia-l4t-jetson-multimedia-api && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Install dependencies for OpenCV

# Open CV 4.1.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends libopencv libopencv-dev libopencv-python libopencv-samples opencv-licenses && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
