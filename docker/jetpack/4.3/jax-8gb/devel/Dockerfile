ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.3.1-jax-8gb-jetpack-4.3-runtime

# CUDA Toolkit for L4T

RUN apt-get update && \
    apt-get install -y --allow-downgrades --no-install-recommends cuda-toolkit-10-0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.6.3.28

LABEL com.nvidia.cudnn.version="7.6.3.28"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libcudnn7 libcudnn7-dev libcudnn7-doc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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


LABEL com.nvidia.libinfer.version="6.0.1"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvinfer6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvinfer-bin libnvinfer-dev libnvinfer-doc libnvinfer-samples && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvinfer-plugin-dev libnvinfer-plugin6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


LABEL com.nvidia.tensorrt.version="6.0.1.10"

RUN apt-get update && \
    apt-get install -y --no-install-recommends tensorrt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvparsers6 libnvparsers-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends libnvonnxparsers6 libnvonnxparsers-dev && \
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


# Available versions:
# tensorflow_gpu-1.15.0+nv19.12-cp36-cp36m-linux_aarch64.whl 217MB
# tensorflow_gpu-2.0.0+nv19.12-cp36-cp36m-linux_aarch64.whl 198MB

# Install TensorFlow
#RUN python3 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v43 tensorflow-gpu
# can browse from https://developer.download.nvidia.com/compute/redist/jp/
# RUN python3 -m pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v43 tensorflow-gpu==${TF_VERSION}+nv${NV_VERSION}
