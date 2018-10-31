ARG JETPACK_VERSION=3.3
ARG L4T_VERSION=28.2.1
ARG DEVICE=tx2
FROM l4t:${L4T_VERSION}-${DEVICE}-jetpack-${JETPACK_VERSION} as builder
ARG PCL_VERSION=1.8.0

#UTIL
RUN apt-get update && apt-get install -y --no-install-recommends \
         ca-certificates \
         curl \
         && \
    rm -rf /var/lib/apt/lists/*

#build deps
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         software-properties-common \
         && \
    rm -rf /var/lib/apt/lists/*

#plat deps
RUN apt-get update && apt-get install -y --no-install-recommends \
        mono-complete \
        openjdk-8-jdk \
        openjdk-8-jre \
        qt-sdk \
        && \
        rm -rf /var/lib/apt/lists/*

#PCL Deps
RUN apt-get update && apt-get install -y --no-install-recommends \
         freeglut3-dev \
         libboost-all-dev \
         libeigen3-dev \
         libflann1.8 \
         libflann-dev \
         libglew-dev \
         libopenni-dev \
         libpcap-dev \
         libqhull-dev \
         libusb-1.0-0-dev \
         libusb-dev \
         libxi-dev \
         libxmu-dev \
         libudev-dev \
         linux-libc-dev \
         && \
    rm -rf /var/lib/apt/lists/*

# VTK 7.1.1
RUN curl -sL https://www.vtk.org/files/release/7.1/VTK-7.1.0.tar.gz -o VTK-7.1.0.tar.gz && \
    echo "a7e814c1db503d896af72458c2d0228f VTK-7.1.0.tar.gz" | md5sum -c - && \
    tar -xf VTK-7.1.0.tar.gz && \ 
    rm VTK-7.1.0.tar.gz && \
    mkdir VTK-7.1.0/build && \
    cd VTK-7.1.0/build && \
    cmake .. && \
    make && \
    echo nvidia | make install && \
    rm -rf VTK-7.1.0

WORKDIR /usr/lib/aarch64-linux-gnu/
RUN ln -sf tegra/libGL.so libGL.so

WORKDIR /
RUN git clone --recursive --depth 1 https://github.com/PointCloudLibrary/pcl.git -b pcl-${PCL_VERSION}

RUN mkdir /pcl/build
WORKDIR /pcl/build

ARG DEVICE
COPY compile.${DEVICE}.sh ./compile.sh
RUN chmod +x ./compile.sh && ./compile.sh

FROM alpine:latest
ARG PCL_VERSION
COPY --from=builder /pcl/build/PCL-${PCL_VERSION}-Linux.deb ./
