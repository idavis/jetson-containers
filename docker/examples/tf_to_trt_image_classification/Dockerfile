ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.1-jax-jetpack-4.2-devel

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

ARG JP42_PY_FEED_URL=https://developer.download.nvidia.com/compute/redist/jp/v42

RUN python3 -m pip install --extra-index-url ${JP42_PY_FEED_URL} tensorflow-gpu

RUN git clone --recursive --depth 1 https://github.com/NVIDIA-Jetson/tf_to_trt_image_classification.git -b trt_4plus
RUN cd tf_to_trt_image_classification && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make

WORKDIR tf_to_trt_image_classification
RUN echo "#!/bin/bash" >> run.sh && \
    echo "source scripts/download_models.sh" >> run.sh && \
    echo "python3 scripts/models_to_frozen_graphs.py" >> run.sh && \
    echo "source scripts/download_images.sh" >> run.sh && \
    echo "python3 scripts/convert_plan.py data/frozen_graphs/inception_v1.pb data/plans/inception_v1.plan input 224 224 InceptionV1/Logits/SpatialSqueeze 1 0 float" >> run.sh && \
    echo "python3 scripts/frozen_graphs_to_plans.py" >> run.sh && \
    echo "python3 scripts/test_trt.py" >> run.sh && \
    echo "python3 scripts/test_tf.py" >> run.sh && \
    chmod +x run.sh

