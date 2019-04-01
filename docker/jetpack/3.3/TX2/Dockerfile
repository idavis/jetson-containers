FROM l4t:28.2.1-tx2

ENV JETPACK_VERSION 3.3

LABEL com.nvidia.jetpack.version="${JETPACK_VERSION}"

ARG URL=https://developer.download.nvidia.com/devzone/devcenter/mobile/jetpack_l4t/3.3/lw.xd42/JetPackL4T_33_b39/

ENV CUDA_VERSION 9.0.252

ENV CUDA_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

# CUDA Toolkit for L4T

RUN curl -sL $URL/cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb -o cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb && \
    echo "9385806be429ad92d49f0750f748e2b2 cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb && \
    rm cuda-repo-l4t-9-0-local_${CUDA_PKG_VERSION}_arm64.deb && \
    apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.1.5.14

ENV CUDNN_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN curl -sL $URL/libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb -o libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    echo "b846bf9573a5cee7fc29f22171fc3cd0 libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    rm libcudnn7_$CUDNN_VERSION-1+cuda9.0_arm64.deb

RUN curl -sL $URL/libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb -o libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    echo "54123b591320ff9157290b17c5d340b4 libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    rm libcudnn7-dev_$CUDNN_VERSION-1+cuda9.0_arm64.deb

RUN curl -sL $URL/libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb -o libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    echo "7f8fc27dc9a31d5f1740c941b90c0d9c libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb && \
    rm libcudnn7-doc_$CUDNN_VERSION-1+cuda9.0_arm64.deb

# CUDA Toolkit
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
ENV LIBINFER_VERSION 4.1.3

ENV LIBINFER_PKG_VERSION=${LIBINFER_VERSION}-1

LABEL com.nvidia.libinfer.version="${LIBINFER_VERSION}"

ENV LIBINFER_PKG libnvinfer4_${LIBINFER_PKG_VERSION}+cuda9.0_arm64.deb

ENV LIBINFER_DEV_PKG libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda9.0_arm64.deb

ENV LIBINFER_SAMPLES_PKG libnvinfer-samples_${LIBINFER_PKG_VERSION}+cuda9.0_arm64.deb

RUN curl -sL $URL/${LIBINFER_PKG} -o ${LIBINFER_PKG} && \
    echo "682e2d8a8f0200ea18471d03f0f35124 ${LIBINFER_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_PKG} && \
    rm ${LIBINFER_PKG}

RUN curl -sL $URL/${LIBINFER_DEV_PKG} -o ${LIBINFER_DEV_PKG} && \
    echo "eb44e8a0eb5fb9a294407c14ea87e71a ${LIBINFER_DEV_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_DEV_PKG} && \
    rm ${LIBINFER_DEV_PKG}

RUN curl -sL $URL/${LIBINFER_SAMPLES_PKG} -o ${LIBINFER_SAMPLES_PKG} && \
    echo "354f197403e5d54b934be7e5d16553e8 ${LIBINFER_SAMPLES_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_SAMPLES_PKG} && \
    rm ${LIBINFER_SAMPLES_PKG}

ENV TENSORRT_VERSION 4.0.2.0

ENV TENSORRT_PKG_VERSION=${TENSORRT_VERSION}-1

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda9.0_arm64.deb

RUN curl -sL $URL/${TENSORRT_PKG} -o ${TENSORRT_PKG} && \
    echo "7988fc251c4a0a1ef711cc9287c19c0e ${TENSORRT_PKG}" | md5sum -c - && \
    dpkg -i ${TENSORRT_PKG} && \
    rm ${TENSORRT_PKG}

ENV LIBGIE_VERSION 4.1.3

ENV LIBGIE_PKG_VERSION=${LIBGIE_VERSION}-1

LABEL com.nvidia.libgie.version="${LIBGIE_VERSION}"

ENV LIBGIE_PKG libgie-dev_${LIBGIE_PKG_VERSION}+cuda9.0_arm64.deb

RUN curl -sL $URL/${LIBGIE_PKG} -o ${LIBGIE_PKG} && \
    echo "efc1e8dda2fd056a1d2de3719dabbd20 ${LIBGIE_PKG}" | md5sum -c - && \
    dpkg -i ${LIBGIE_PKG} && \
    rm ${LIBGIE_PKG}

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
    rm libopencv_${OPENCV_PKG_VERSION}_arm64.deb

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
