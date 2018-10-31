ARG JETPACK_VERSION=3.3
ARG L4T_VERSION=28.2.1
ARG DEVICE=tx2
FROM l4t:${L4T_VERSION}-${DEVICE}-jetpack-${JETPACK_VERSION} as builder

# install python & depedencies
RUN apt-get update && apt-get install -y \
        python3 \
        python3-dev \
        python3-pip \
        python3-setuptools && \
    rm -rf /var/lib/apt/lists/*

# pip 10 brakes some packages on aarch64
RUN python3 -m pip install --upgrade pip==9.0.3 && \
    python3 -m pip install numpy==1.14.0 Cython==0.28.5 pandas==0.22.0 datetime

# TODO: Pull from opencv-3.4.2-<platform> image
COPY --from=opencv-install:3.4.3-l4t-28.2.1-tx2-jetpack-3.3-linux-aarch64 OpenCV-3.4.3-aarch64.sh && \
    chmod +x ./OpenCV-3.4.3-aarch64.sh && \
    ./OpenCV-3.4.3-aarch64.sh --prefix=/usr/local --exclude-subdir && \
    rm OpenCV-3.4.3-aarch64.sh
