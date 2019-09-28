ARG IMAGE_NAME
ARG TAG
FROM ${IMAGE_NAME}:${TAG}-devel

RUN apt-get update && \
    apt-get install -y \
    libssl1.0.0 \
    libgstreamer1.0-0 \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    libgstrtspserver-1.0-0 \
    libjansson4 \
    libjson-glib-1.0-0 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./deepstream-4.0_4.0-1_arm64.deb /deepstream-4.0_4.0-1_arm64.deb
RUN dpkg -i /deepstream-4.0_4.0-1_arm64.deb && \
    rm /deepstream-4.0_4.0-1_arm64.deb
RUN export LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:$LD_LIBRARY_PATH
RUN ldconfig
WORKDIR /opt/nvidia/deepstream/deepstream-4.0/samples
