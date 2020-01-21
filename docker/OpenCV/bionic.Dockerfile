ARG IMAGE
FROM ${IMAGE}

RUN apt-get update && apt-get install -y \
    cmake 3.12 \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    python-dev \
    python-numpy \
    python-py \
    python-pytest \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    python3-dev \
    python3-numpy \
    python3-py \
    python3-pytest \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    build-essential \
    libgtk2.0-dev \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libavutil-dev \
    libeigen3-dev \
    libglew-dev \
    libtiff5-dev \
    libjpeg-dev \
    libpng-dev \
    libpostproc-dev \
    libtbb-dev \
    libxvidcore-dev \
    libx264-dev \
    zlib1g-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ffmpeg \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# GStreamer support
RUN apt-get update && apt-get install -y \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install numpy setuptools

ARG OPENCV_GIT_VERSION=4.1.2

LABEL opencv.version="${OPENCV_GIT_VERSION}"

RUN git clone --depth 1 https://github.com/opencv/opencv.git -b ${OPENCV_GIT_VERSION} && \
    git clone --depth 1 https://github.com/opencv/opencv_extra.git -b ${OPENCV_GIT_VERSION} && \
    git clone --depth 1 https://github.com/opencv/opencv_contrib.git -b ${OPENCV_GIT_VERSION}

RUN mkdir opencv/build
WORKDIR opencv/build

ARG CUDA_ARCH_BIN
COPY compile.sh ./compile.sh
RUN chmod +x ./compile.sh
RUN ./compile.sh
