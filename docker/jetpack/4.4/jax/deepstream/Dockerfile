ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.4.3-jax-jetpack-4.4-base

# NVIDIA VisionWorks Toolkit

RUN apt-get update && \
    apt-get install -y --no-install-recommends libvisionworks && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Plus (SFM)
RUN apt-get update && \
    apt-get install -y --no-install-recommends libvisionworks-sfm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Object Tracker
RUN apt-get update && \
    apt-get install -y --no-install-recommends libvisionworks-tracking && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA TensorRT


LABEL com.nvidia.tensorrt.version="7.1.3.0"

RUN apt-get update && \
    apt-get install -y --no-install-recommends tensorrt && \
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

# Open CV 4.1.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends libopencv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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


RUN apt-get update && apt-get install -y --no-install-recommends deepstream-5.0=5.0.1-1 && \

    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN ldconfig
WORKDIR /opt/nvidia/deepstream/deepstream-4.0/samples