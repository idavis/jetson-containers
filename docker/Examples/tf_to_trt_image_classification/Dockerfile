ARG JETPACK_VERSION=4.1.1
ARG L4T_VERSION=31.1
ARG DEVICE=xavier

FROM l4t:31.1-xavier as tensorrtsrc

ARG JETPACK_VERSION
ARG L4T_VERSION
ARG DEVICE

ARG TENSORRT_URL
ARG TENSORRT_ARCHIVE=TensorRT-5.0.2.6.Ubuntu-18.04.1.x86_64-gnu.cuda-10.0.cudnn7.3.tar.gz

RUN curl -sL $TENSORRT_URL/${TENSORRT_ARCHIVE} -o ${TENSORRT_ARCHIVE} && \
    echo "2e192726f07133b03920e5919a84616e *./${TENSORRT_ARCHIVE}" | md5sum -c - && \
    tar -xvzf ./${TENSORRT_ARCHIVE} && \
    mv TensorRT*/uff/*.whl . && \
    mv TensorRT*/python/*.whl . && \
    mv TensorRT*/graphsurgeon/*.whl  . && \
    rm -rf ./TensorRT-*/ && \
    rm ./${TENSORRT_ARCHIVE}

FROM l4t:${L4T_VERSION}-${DEVICE}-jetpack-${JETPACK_VERSION}

# install python & depedencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake 3.12 \
    git \
    libhdf5-dev \
    libhdf5-serial-dev \
    python-dev \
    python-h5py \
    python-pip \
    python-setuptools \
    wget \
    && \
    python -m pip install --upgrade pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=tensorrtsrc *.whl /
RUN python -m pip install *.whl && \
    python -m pip install numpy --upgrade && \
    rm *.whl

ARG JP411_PY_FEED_URL=https://developer.download.nvidia.com/compute/redist/jp/v411/
#ARG TF_WHEEL=tensorflow_gpu-1.12.0+nv18.12-cp36-cp36m-linux_aarch64.whl

RUN python -m pip install --extra-index-url ${JP411_PY_FEED_URL} tensorflow-gpu
#RUN python3 -m pip install --extra-index-url ${JP411_PY_FEED_URL} tensorflow-gpu

RUN git clone --recursive --depth 1 https://github.com/NVIDIA-Jetson/tf_to_trt_image_classification.git -b trt_4plus
RUN cd tf_to_trt_image_classification && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make

WORKDIR tf_to_trt_image_classification
RUN echo "#!/bin/bash" >> run.sh && \
    echo "source scripts/download_models.sh" >> run.sh && \
    echo "python scripts/models_to_frozen_graphs.py" >> run.sh && \
    echo "source scripts/download_images.sh" >> run.sh && \
    echo "python scripts/convert_plan.py data/frozen_graphs/inception_v1.pb data/plans/inception_v1.plan input 224 224 InceptionV1/Logits/SpatialSqueeze 1 0 float" >> run.sh && \
    echo "python scripts/frozen_graphs_to_plans.py" >> run.sh && \
    echo "python scripts/test_trt.py" >> run.sh && \
    echo "python scripts/test_tf.py" >> run.sh && \
    chmod +x run.sh

