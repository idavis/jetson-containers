FROM l4t:28.2.1-tx2

ENV JETPACK_VERSION 3.2.1

LABEL com.nvidia.jetpack.version="${JETPACK_VERSION}"

ARG URL=https://developer.download.nvidia.com/devzone/devcenter/mobile/jetpack_l4t/3.2.1/m8u2ki/JetPackL4T_321_b23/

ENV CUDA_VERSION 9.0.252

ENV CUDA_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

RUN curl -sL $URL/cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb -o cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb && \
    echo "9385806be429ad92d49f0750f748e2b2 cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb && \
    rm cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb && \
    apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub

ENV CUDNN_VERSION 7.0.5.15

ENV CUDNN_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN curl -sL $URL/libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb -o libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    echo "6aab1d77a60871a0ee0d306aee6f9a0e libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    rm libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb

RUN curl -sL $URL/libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb -o libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    echo "919feccd183273cd3b1efab1aca39f04 libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    rm libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb

RUN curl -sL $URL/libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb -o libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    echo "f1746b71c84cf42542a42e9b52e03f2d libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    rm libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb

RUN apt-get update && apt-get install -y \
        cuda-toolkit-9.0 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Toolkit
RUN curl -sL $URL/libvisionworks-repo_1.6.0.500n_arm64.deb -o libvisionworks-repo_1.6.0.500n_arm64.deb && \
    echo "066cb90ca605f805aa616c5be6b06926 libvisionworks-repo_1.6.0.500n_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-repo_1.6.0.500n_arm64.deb && \
    rm libvisionworks-repo_1.6.0.500n_arm64.deb

# NVIDIA VisionWorks Plus (SFM)
RUN curl -sL $URL/libvisionworks-sfm-repo_0.90.3_arm64.deb -o libvisionworks-sfm-repo_0.90.3_arm64.deb && \
    echo "e36622e3a342f56fa9c2a23ecae871c1 libvisionworks-sfm-repo_0.90.3_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-sfm-repo_0.90.3_arm64.deb && \
    rm libvisionworks-sfm-repo_0.90.3_arm64.deb

# NVIDIA VisionWorks Object Tracker
RUN curl -sL $URL/libvisionworks-tracking-repo_0.88.1_arm64.deb -o libvisionworks-tracking-repo_0.88.1_arm64.deb && \
    echo "527f40c2705f0f2eb810d659cb8c152d libvisionworks-tracking-repo_0.88.1_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-tracking-repo_0.88.1_arm64.deb && \
    rm libvisionworks-tracking-repo_0.88.1_arm64.deb

# NVIDIA TensorRT
RUN curl -sL $URL/nv-tensorrt-repo-ubuntu1604-ga-cuda9.0-trt3.0.4-20180208_1-1_arm64.deb -o nv-tensorrt-repo-ubuntu1604-ga-cuda9.0-trt3.0.4-20180208_1-1_arm64.deb && \
    echo "5d625140e1a7c92706191b1f4cbc4cce nv-tensorrt-repo-ubuntu1604-ga-cuda9.0-trt3.0.4-20180208_1-1_arm64.deb" | md5sum -c - && \
    dpkg -i nv-tensorrt-repo-ubuntu1604-ga-cuda9.0-trt3.0.4-20180208_1-1_arm64.deb && \
    rm nv-tensorrt-repo-ubuntu1604-ga-cuda9.0-trt3.0.4-20180208_1-1_arm64.deb

# Multimedia API
# ffc676c2bfae02c74c7520e7b72ab757 Tegra_Multimedia_API_R28.2.1_aarch64.tbz2
# Skipping unless needed.

# Install dependencies for OpenCV
RUN apt-get update && apt-get install -y \
        libavcodec-ffmpeg56 \
        libavformat-ffmpeg56 \
        libcairo2 \
        libgtk2.0-0 \
        libjasper1 \
        libswscale-ffmpeg3 \
        libtbb2 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Open CV 3.3.1

ENV OPENCV_VERSION 3.3.1

ENV OPENCV_PKG_VERSION=${OPENCV_VERSION}_t186

## Open CV
#RUN set -o pipefail && \
RUN curl -sL $URL/libopencv_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "919aba869414845a1e36ba5e6d414ce4 libopencv_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm  libopencv_${OPENCV_PKG_VERSION}_arm64.deb

## Open CV python binding
#RUN set -o pipefail && \
RUN curl -sL $URL/libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "7ad4ca02aaddcdd7c1ce3105d32bbd24 libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb

# Install dependencies for OpenCV dev
RUN apt-get update && apt-get install -y \
    libtbb-dev \
    && rm -rf /var/lib/apt/lists/*

## Open CV dev
#RUN set -o pipefail && \
RUN curl -sL $URL/libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "1cd568ace874939c2e83a42c3de0ae40 libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb

## Open CV samples
#RUN set -o pipefail && \
#RUN curl -sL $URL/libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb && \
#    echo "0165fad7b53f08fc5db735e7027c648f libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
#    dpkg -i libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb && \
#    rm libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb
