ARG IMAGE
FROM ${IMAGE}

RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         ca-certificates \
         libjpeg-dev \
         libpng-dev && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-dev \
    python3-numpy \
    python3-pip \
    python3-py \
    python3-pytest \
    python3-setuptools \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG PYTORCH_GIT_VERSION

# Once PyTorch releases the NCCL bug, we can start using tags/branches again.
# https://github.com/pytorch/pytorch/pull/17295
#RUN git clone --recursive --depth 1 https://github.com/pytorch/pytorch.git -b ${PYTORCH_GIT_VERSION}
RUN git clone --recursive https://github.com/pytorch/pytorch.git
WORKDIR pytorch
RUN git checkout b90cbb841d98aeae435b1d02b1ff211e028cdf5b

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt
RUN python3 -m pip install scikit-build
RUN python3 -m pip install ninja

ARG USE_OPENCV=0
ARG USE_FFMPEG=0
ARG USE_CUDNN=1
ARG USE_TENSORRT=0

ARG TORCH_CUDA_ARCH_LIST

ENV USE_OPENCV=${USE_OPENCV}
ENV USE_FFMPEG=${USE_FFMPEG}
ENV USE_CUDNN=${USE_CUDNN}
ENV USE_TENSORRT=${USE_TENSORRT}

ENV TORCH_CUDA_ARCH_LIST=${TORCH_CUDA_ARCH_LIST}

ENV USE_CUDA=1
ENV USE_NCCL=0
ENV USE_DISTRIBUTED=0
ENV BUILD_TORCH=ON
ENV BUILD_BINARY=ON

RUN python3 setup.py bdist_wheel

