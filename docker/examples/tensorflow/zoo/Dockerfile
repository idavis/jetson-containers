ARG IMAGE_NAME
ARG TAG
FROM ${IMAGE_NAME}:${TAG}-devel as tensorflow-base

RUN apt-get update && apt-get install -y \
    build-essential \
    libhdf5-dev \
    libhdf5-serial-dev \
    python3-dev \
    python3-h5py \
    python3-pip \
    python3-setuptools \
    && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir --upgrade setuptools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir -U numpy grpcio absl-py py-cpuinfo psutil portpicker grpcio six mock requests gast astor termcolor

# Install TensorFlow

#RUN python3 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu
# can browse from https://developer.download.nvidia.com/compute/redist/jp/
#RUN python3 -m pip install --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==$TF_VERSION+nv$NV_VERSION

RUN python3 -m pip install --no-cache-dir --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==1.14.0+nv19.7


FROM tensorflow-base as objectdetection-builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    protobuf-compiler \
    && \
    rm -rf /var/lib/apt/lists/*

# Clone the TensorFlow Models Repository
# the release branches usually don't contain the research folder, so we have to use master.
ARG TF_MODELS_VERSION=master
RUN git clone --depth 1 https://github.com/tensorflow/models.git -b ${TF_MODELS_VERSION}

WORKDIR /models/research

# Compile the Protos

RUN protoc object_detection/protos/*.proto --python_out=.

# Build the Wheels

RUN python3 setup.py build && \
    python3 setup.py bdist_wheel && \
    (cd slim && python3 setup.py bdist_wheel)


FROM tensorflow-base as app-base

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    pkg-config \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=objectdetection-builder /models/research/dist/object_detection-0.1-py3-none-any.whl .
COPY --from=objectdetection-builder /models/research/slim/dist/slim-0.1-py3-none-any.whl .
RUN python3 -m pip install --no-cache-dir object_detection-0.1-py3-none-any.whl && \
    python3 -m pip install --no-cache-dir slim-0.1-py3-none-any.whl && \
    rm object_detection-0.1-py3-none-any.whl && \
    rm slim-0.1-py3-none-any.whl

COPY --from=objectdetection-builder /models/research/object_detection/data /data

# App dependencies

RUN apt-get update && apt-get install -y --no-install-recommends \
   libavcodec-dev \
   libavformat-dev \
   libavutil-dev \
   libeigen3-dev \
   libglew-dev \
   libtiff5-dev \
   libjpeg-dev \
   libpng-dev \
   libpostproc-dev \
   libswscale-dev \
   libtbb-dev \
   libgtk2.0-dev \
   libxvidcore-dev \
   libx264-dev \
   zlib1g-dev \
   libxml2-dev \
   libxslt1-dev \
   libcanberra-gtk-module \
   && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/*

FROM app-base

RUN mkdir app
WORKDIR /app

COPY requirements.txt ./

RUN python3 -m pip install --no-cache-dir --user -r requirements.txt

COPY app.py ./

#RUN useradd -ms /bin/bash moduleuser
#USER moduleuser

RUN echo "#!/bin/bash" >> entrypoint.sh && \
    echo "python3 app.py \$*" >> entrypoint.sh && \
    chmod +x entrypoint.sh

ENTRYPOINT ["sh", "-c", "./entrypoint.sh $*", "--"]
