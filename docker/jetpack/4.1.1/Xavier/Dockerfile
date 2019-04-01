FROM l4t:31.1-xavier

ENV JETPACK_VERSION "4.1.1"

LABEL com.nvidia.jetpack.version="${JETPACK_VERSION}"

ARG URL=https://developer.download.nvidia.com/devzone/devcenter/mobile/jetpack_l4t/4.1.1/xddsn.im/JetPackL4T_4.1.1_b57

ENV CUDA_VERSION 10.0.117_1.0

ENV CUDA_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

# Prereqs

RUN apt-get update && \
    apt-get install -y gnupg2 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# CUDA Toolkit for L4T

ENV CUDA_TOOLKIT_PKG "cuda-repo-l4t-10-0-local-${CUDA_PKG_VERSION}_arm64.deb"

RUN curl -sL $URL/${CUDA_TOOLKIT_PKG} -o ${CUDA_TOOLKIT_PKG} && \
    echo "82616939c933a7aa33a073bbaf029f42 ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-key add /var/cuda-repo-*-local*/*.pub

# CUDA Toolkit

RUN apt-get update && \
    apt-get install -y --allow-downgrades cuda-toolkit-10-0 libgomp1 libfreeimage-dev libopenmpi-dev openmpi-bin \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN grep -q "export PATH=.*/usr/local/cuda-10/bin" ~/.bashrc || echo "export PATH=/usr/local/cuda-10/bin:$PATH">>~/.bashrc && \
    grep -q "export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64" ~/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc && \
    export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:${LD_LIBRARY_PATH}

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.3.1.20

ENV CUDNN_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN curl -sL $URL/libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb -o libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    echo "9cf73c1e0fbcc42347a26eb8063b11cd libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb

RUN curl -sL $URL/libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb -o libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    echo "3f7a7ef6422f964f4298d390b82c8985 libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb

RUN curl -sL $URL/libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb -o libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    echo "5533177508406c84b543c37d090f9846 libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb

# NVIDIA VisionWorks Toolkit
RUN curl -sL $URL/libvisionworks-repo_1.6.0.500n_arm64.deb -o libvisionworks-repo_1.6.0.500n_arm64.deb && \
    echo "73961d2e2b387d2116eb85710d80aeb3 libvisionworks-repo_1.6.0.500n_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-repo_1.6.0.500n_arm64.deb && \
    rm libvisionworks-repo_1.6.0.500n_arm64.deb

# NVIDIA VisionWorks Plus (SFM)
RUN curl -sL $URL/libvisionworks-sfm-repo_0.90.3_arm64.deb -o libvisionworks-sfm-repo_0.90.3_arm64.deb && \
    echo "c32a242d215e32950a590ed6d5e449bc libvisionworks-sfm-repo_0.90.3_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-sfm-repo_0.90.3_arm64.deb && \
    rm libvisionworks-sfm-repo_0.90.3_arm64.deb

# NVIDIA VisionWorks Object Tracker
RUN curl -sL $URL/libvisionworks-tracking-repo_0.88.2_arm64.deb -o libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    echo "c75c43005938899080c8193f89020e8a libvisionworks-tracking-repo_0.88.2_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    rm libvisionworks-tracking-repo_0.88.2_arm64.deb

# NVIDIA TensorRT
ENV LIBINFER_VERSION 5.0.3

ENV LIBINFER_PKG_VERSION=${LIBINFER_VERSION}-1

LABEL com.nvidia.libinfer.version="${LIBINFER_VERSION}"

ENV LIBINFER_PKG libnvinfer5_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

ENV LIBINFER_DEV_PKG libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

ENV LIBINFER_SAMPLES_PKG libnvinfer-samples_${LIBINFER_PKG_VERSION}+cuda10.0_all.deb

RUN curl -sL $URL/${LIBINFER_PKG} -o ${LIBINFER_PKG} && \
    echo "6880ccc6d8a8dc3ef023d3b485c1c692 ${LIBINFER_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_PKG} && \
    rm ${LIBINFER_PKG}

RUN curl -sL $URL/${LIBINFER_DEV_PKG} -o ${LIBINFER_DEV_PKG} && \
    echo "beb81ab9eba95a813c16b147af338021 ${LIBINFER_DEV_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_DEV_PKG} && \
    rm ${LIBINFER_DEV_PKG}

RUN curl -sL $URL/${LIBINFER_SAMPLES_PKG} -o ${LIBINFER_SAMPLES_PKG} && \
    echo "fdaf46c4dfcd1cb1fd2c204037897959 ${LIBINFER_SAMPLES_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_SAMPLES_PKG} && \
    rm ${LIBINFER_SAMPLES_PKG}

ENV TENSORRT_VERSION 5.0.3.2

ENV TENSORRT_PKG_VERSION=${TENSORRT_VERSION}-1

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda10.0_arm64.deb

RUN curl -sL $URL/${TENSORRT_PKG} -o ${TENSORRT_PKG} && \
    echo "c85440db53d78deb1f7127e233b9e36b ${TENSORRT_PKG}" | md5sum -c - && \
    dpkg -i ${TENSORRT_PKG} && \
    rm ${TENSORRT_PKG}

ENV LIBGIE_VERSION 5.0.3

ENV LIBGIE_PKG_VERSION=${LIBGIE_VERSION}-1

LABEL com.nvidia.libgie.version="${LIBGIE_VERSION}"

ENV LIBGIE_PKG libgie-dev_${LIBGIE_PKG_VERSION}+cuda10.0_all.deb

RUN curl -sL $URL/${LIBGIE_PKG} -o ${LIBGIE_PKG} && \
    echo "de59fa92c3d36bfc3b84113db026611b ${LIBGIE_PKG}" | md5sum -c - && \
    dpkg -i ${LIBGIE_PKG} && \
    rm ${LIBGIE_PKG}

# Multimedia API
# 65f1812bf594d8fe8346c2325cf930f6 Tegra_Multimedia_API_R31.1.0_aarch64.tbz2
# Skipping unless needed.

# Install dependencies for OpenCV
RUN apt-get update && apt-get install -y \
        libavcodec-extra57 \
        libavformat57 \
        libavutil55 \
        libcairo2 \
        libgtk2.0-0 \
        libswscale4 \
        libtbb2 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Open CV 3.3.1

ENV OPENCV_VERSION 3.3.1

ENV OPENCV_PKG_VERSION=${OPENCV_VERSION}

## Open CV
RUN curl -sL $URL/libopencv_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "2699c81c618bff9b43942ca78705b3d3 libopencv_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv_${OPENCV_PKG_VERSION}_arm64.deb

## Open CV python binding
RUN curl -sL $URL/libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "d6fa67ef2f7d0a451f9950f4ba96121d libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb

# Install dependencies for OpenCV dev
RUN apt-get update && apt-get install -y \
    libtbb-dev \
    && rm -rf /var/lib/apt/lists/*

# Open CV dev
RUN curl -sL $URL/libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "57638480096afec0909c14ba6da0ff89 libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb

## Open CV samples
#RUN curl -sL $URL/libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb && \
#    echo "1a1eef7e9f6de21327dc9ae66c0f289f libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
#    dpkg -i libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb && \
#    rm libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb

