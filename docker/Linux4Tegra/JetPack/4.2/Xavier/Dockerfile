FROM l4t:32.1-jax-tx2

ENV JETPACK_VERSION "4.2"

LABEL com.nvidia.jetpack.version="${JETPACK_VERSION}"

ARG URL=https://developer.nvidia.com/assets/embedded/secure/tools/files/jetpack-sdks/jetpack-4.2/JETPACK_42_b158
ARG HWID=P2888

ENV CUDA_VERSION 10.0.166_1.0

ENV CUDA_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

# Prereqs

RUN apt-get update && \
    apt-get install -y gnupg \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# CUDA Toolkit for L4T

ENV CUDA_TOOLKIT_PKG "cuda-repo-l4t-10-0-local-${CUDA_PKG_VERSION}_arm64.deb"

RUN curl -sL $URL/${CUDA_TOOLKIT_PKG} -o ${CUDA_TOOLKIT_PKG} && \
    echo "5e3eedc3707305f9022d41754d6becde ${CUDA_TOOLKIT_PKG}" | md5sum -c - && \
    dpkg --force-all -i ${CUDA_TOOLKIT_PKG} && \
    rm ${CUDA_TOOLKIT_PKG} && \
    apt-key add /var/cuda-repo-*-local*/*.pub
    
RUN apt-get update && \
    apt-get install -y --allow-downgrades cuda-toolkit-10-0 libgomp1 libfreeimage-dev libopenmpi-dev openmpi-bin \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN grep -q "export PATH=.*/usr/local/cuda-10/bin" ~/.bashrc || echo "export PATH=/usr/local/cuda-10/bin:$PATH">>~/.bashrc && \
    grep -q "export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64" ~/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc && \
    export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:${LD_LIBRARY_PATH}

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.3.1.28

ENV CUDNN_PKG_VERSION=${CUDA_VERSION}-1

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN curl -sL $URL/${HWID}/libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb -o libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    echo "92867c0a495f84ec11d108f84b776620 libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7_$CUDNN_VERSION-1+cuda10.0_arm64.deb

RUN curl -sL $URL/${HWID}/libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb -o libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    echo "dd0fbfa225b2374b946febc98e2cdec4 libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_$CUDNN_VERSION-1+cuda10.0_arm64.deb

RUN curl -sL $URL/${HWID}/libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb -o libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    echo "9478c16ceeaaca937d4d26b982e48bd1 libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb && \
    rm libcudnn7-doc_$CUDNN_VERSION-1+cuda10.0_arm64.deb

# NVIDIA VisionWorks Toolkit
RUN curl -sL $URL/libvisionworks-repo_1.6.0.500n_arm64.deb -o libvisionworks-repo_1.6.0.500n_arm64.deb && \
    echo "e70d49ff115bc5782a3d07b572b5e3c0 libvisionworks-repo_1.6.0.500n_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-repo_1.6.0.500n_arm64.deb && \
    apt-key add /var/visionworks-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated libvisionworks libvisionworks-dev libvisionworks-samples && \
    rm libvisionworks-repo_1.6.0.500n_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Plus (SFM)
RUN curl -sL $URL/libvisionworks-sfm-repo_0.90.4_arm64.deb -o libvisionworks-sfm-repo_0.90.4_arm64.deb && \
    echo "647b0ae86a00745fc6d211545a9fcefe libvisionworks-sfm-repo_0.90.4_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-sfm-repo_0.90.4_arm64.deb && \
    apt-key add /var/visionworks-sfm-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated libvisionworks-sfm libvisionworks-sfm-dev && \
    /usr/share/visionworks-sfm/sources/install-samples.sh ~/ && \
    cd ~/VisionWorks-SFM-*-Samples/ && \
    make && \
    rm libvisionworks-sfm-repo_0.90.4_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA VisionWorks Object Tracker
RUN curl -sL $URL/libvisionworks-tracking-repo_0.88.2_arm64.deb -o libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    echo "7630f0309c883cc6d8a1ab5a712938a5 libvisionworks-tracking-repo_0.88.2_arm64.deb" | md5sum -c - && \
    dpkg -i libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    apt-key add /var/visionworks-tracking-repo/GPGKEY && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated libvisionworks-tracking libvisionworks-tracking-dev && \
    rm libvisionworks-tracking-repo_0.88.2_arm64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# NVIDIA TensorRT
ENV LIBINFER_VERSION 5.0.6

ENV LIBINFER_PKG_VERSION=${LIBINFER_VERSION}-1

LABEL com.nvidia.libinfer.version="${LIBINFER_VERSION}"

ENV LIBINFER_PKG libnvinfer5_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

ENV LIBINFER_DEV_PKG libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

ENV LIBINFER_SAMPLES_PKG libnvinfer-samples_${LIBINFER_PKG_VERSION}+cuda10.0_all.deb

RUN curl -sL $URL/${HWID}/${LIBINFER_PKG} -o ${LIBINFER_PKG} && \
    echo "70526ede410bca53d7f6ce60e082178b ${LIBINFER_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_PKG} && \
    rm ${LIBINFER_PKG}

RUN curl -sL $URL/${HWID}/${LIBINFER_DEV_PKG} -o ${LIBINFER_DEV_PKG} && \
    echo "b28b9283c3d02282cc5670988de1fbe8 ${LIBINFER_DEV_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_DEV_PKG} && \
    rm ${LIBINFER_DEV_PKG}

RUN curl -sL $URL/${HWID}/${LIBINFER_SAMPLES_PKG} -o ${LIBINFER_SAMPLES_PKG} && \
    echo "aa6d4a5ced259a714fe73baf4ce46061 ${LIBINFER_SAMPLES_PKG}" | md5sum -c - && \
    dpkg -i ${LIBINFER_SAMPLES_PKG} && \
    rm ${LIBINFER_SAMPLES_PKG}

ENV TENSORRT_VERSION 5.0.6.3

ENV TENSORRT_PKG_VERSION=${TENSORRT_VERSION}-1

LABEL com.nvidia.tensorrt.version="${TENSORRT_VERSION}"

ENV TENSORRT_PKG tensorrt_${TENSORRT_PKG_VERSION}+cuda10.0_arm64.deb

RUN curl -sL $URL/${HWID}/${TENSORRT_PKG} -o ${TENSORRT_PKG} && \
    echo "6b9f36d9fd382576605c95fe9d3e744b ${TENSORRT_PKG}" | md5sum -c - && \
    dpkg -i ${TENSORRT_PKG} && \
    rm ${TENSORRT_PKG}

# Python2 support for TensorRT
RUN curl -sL $URL/${HWID}/python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb -o python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    echo "5229e27def0022d5de32582437a8e5a5 python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

RUN curl -sL $URL/${HWID}/python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb -o python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    echo "b5c0812db5b560f6f5da64e5a59f464d python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# Python3 support for TensorRT
RUN curl -sL $URL/${HWID}/python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb -o python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    echo "a3644cb618ca6b1148fa3517a8450e62 python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python3-libnvinfer_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

RUN curl -sL $URL/${HWID}/python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb -o python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    echo "376ef649841d1347e4ddfdb8b323d084 python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm python3-libnvinfer-dev_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# Graph Surgeon
RUN curl -sL $URL/${HWID}/graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb -o graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    echo "0fac7150098e3dfd921e353067e95dd3 graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm graphsurgeon-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# UFF Converter
RUN curl -sL $URL/${HWID}/uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb-o uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    echo "c1592b4bd7c56a3b5ec883e8e846d9bf uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb" | md5sum -c - && \
    dpkg -i uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb && \
    rm uff-converter-tf_${LIBINFER_PKG_VERSION}+cuda10.0_arm64.deb

# Multimedia API
# bf7225ab1f3373328c0def240bc6cec2 P2888/Tegra_Multimedia_API_R32.1.0_aarch64.tbz2
# Skipping unless needed.

# Install dependencies for OpenCV
#RUN apt-get update && apt-get install -y \
#        libavcodec-extra57 \
#        libavformat57 \
#        libavutil55 \
#        libcairo2 \
#        libgtk2.0-0 \
#        libswscale4 \
#    && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*

# Open CV 3.3.1

ENV OPENCV_VERSION 3.3.1

ENV OPENCV_PKG_VERSION=${OPENCV_VERSION}-2-g31ccdfe11

## Open CV

RUN apt-get update && apt-get install -y \
        libtbb2 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL $URL/libopencv_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "dd5b571c08a0098141203daec2ea1acc libopencv_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv_${OPENCV_PKG_VERSION}_arm64.deb

## Open CV python binding

RUN apt-get update && apt-get install -y \
        python-dev \
        python-numpy \
        python-py \
        python-pytest \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL $URL/libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "35776ce159afa78a0fe727d4a3c5b6fa libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-python_${OPENCV_PKG_VERSION}_arm64.deb

# Install dependencies for OpenCV dev
RUN apt-get update && apt-get install -y \
    libtbb-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Open CV dev
RUN curl -sL $URL/libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "d29571f888a59dd290da2650dc202623 libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-dev_${OPENCV_PKG_VERSION}_arm64.deb

# Open CV samples
RUN curl -sL $URL/libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb -o libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb && \
    echo "4f28a7792425b5e1470d5aa73c2a470d libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb" | md5sum -c - && \
    dpkg -i libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb && \
    rm libopencv-samples_${OPENCV_PKG_VERSION}_arm64.deb

