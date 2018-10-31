ARG JETPACK_VERSION=3.3
ARG L4T_VERSION=28.2.1
ARG DEVICE=tx2
FROM l4t:${L4T_VERSION}-${DEVICE}-jetpack-${JETPACK_VERSION} as builder


RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         vim \
         ca-certificates \
         libjpeg-dev \
         libpng-dev &&\
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    python3-dev \
    python3-numpy \
    python3-pip \
    python3-py \
    python3-pytest \
    python3-setuptools \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG PYTORCH_VERSION=0.4.1
RUN git clone --recursive --depth 1 https://github.com/pytorch/pytorch.git -b v${PYTORCH_VERSION}

WORKDIR pytorch

ENV USE_OPENCV=1
ENV BUILD_TORCH=ON

# If building against Python 2.X
#RUN pip2 install --upgrade pip
#RUN pip2 install pyyaml==3.13
#RUN pip2 install -r requirements.txt
#RUN python2 setup.py bdist_wheel

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt
RUN python3 setup.py bdist_wheel

FROM alpine:latest

COPY --from=builder /pytorch/dist/*.whl ./
