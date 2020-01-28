
ARG DEPENDENCIES_IMAGE
ARG IMAGE_NAME
FROM ${DEPENDENCIES_IMAGE} as dependencies

ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.2.1-nano-jetpack-4.2.2-devel

# NVIDIA CUDA Deep Neural Network library (cuDNN)

ENV CUDNN_VERSION 7.5.0.56

LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

COPY --from=dependencies /data/libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb
RUN echo "9f30aa86e505a3b83b127ed7a51309a1 libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb && \
    rm libcudnn7_7.5.0.56-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb
RUN echo "a010637c80859b2143ef24461ee2ef97 libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb && \
    rm libcudnn7-dev_7.5.0.56-1+cuda10.0_arm64.deb

COPY --from=dependencies /data/libcudnn7-doc_7.5.0.56-1+cuda10.0_arm64.deb libcudnn7-doc_7.5.0.56-1+cuda10.0_arm64.deb
RUN echo "f9e43d15ff69d65a85d2aade71a43870 libcudnn7-doc_7.5.0.56-1+cuda10.0_arm64.deb" | md5sum -c - && \
    apt-get update && apt-get install -y --no-install-recommends /libcudnn7-doc_7.5.0.56-1+cuda10.0_arm64.deb && \
    rm libcudnn7-doc_7.5.0.56-1+cuda10.0_arm64.deb