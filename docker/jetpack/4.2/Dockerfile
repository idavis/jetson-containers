ARG VERSION_ID=bionic-20190307
FROM ubuntu:${VERSION_ID} as sdkmanager

# Script Dependencies
RUN apt-get update && apt-get install -y \
    curl \
    docker.io \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# SDK Manager Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    libgconf-2-4 \
    libcanberra-gtk-module \
    libcanberra-gtk3-0 \
    locales \
    libgtk-3-0 \
    libx11-xcb1 \
    libxtst6  \
    libxss1 \
    libnss3 \
    lsb-release \
    sudo \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Workaround for SDK Manager still trying to open a display when run in CLI mode
RUN apt-get update && apt-get install -y \
    xvfb \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG SDK_MANAGER_AUTO_URL=https://developer.nvidia.com/embedded/dlc/nv-sdk-manager
ARG SDK_MANAGER_VERSION=0.9.12
ARG SDK_MANAGER_BUILD=4180
ARG SDK_MANAGER_URL=https://developer.download.nvidia.com/sdkmanager/secure/clients/sdkmanager-${SDK_MANAGER_VERSION}.${SDK_MANAGER_BUILD}
ARG SDK_MANAGER_PACKAGE=sdkmanager_${SDK_MANAGER_VERSION}-${SDK_MANAGER_BUILD}_amd64.deb
ARG SDK_MANAGER_SHA=20e80eb5d4527c0dfe0811c0e76523e58e5b92fd

RUN echo "${SDK_MANAGER_URL}/${SDK_MANAGER_PACKAGE}?$(curl $SDK_MANAGER_AUTO_URL -s -L -I -o /dev/null -w '%{url_effective}' | awk -F "?" '{print $2}')" | xargs curl -sSL -o ./${SDK_MANAGER_PACKAGE} -K- && \
    echo "${SDK_MANAGER_SHA} *./${SDK_MANAGER_PACKAGE}" | sha1sum -c --strict - && \
    apt install ./${SDK_MANAGER_PACKAGE} && \
    rm ./${SDK_MANAGER_PACKAGE}

ARG TEMP_USER=dummy
ARG TEMP_PASSWORD=dummypass

RUN useradd -ms /bin/bash ${TEMP_USER} && \
    usermod -aG docker ${TEMP_USER} && \
    echo ${TEMP_USER}:${TEMP_PASSWORD} | chpasswd && adduser ${TEMP_USER} sudo

USER ${TEMP_USER}

FROM sdkmanager as devicedepsbuilder
# Choice of P2888, P3310, P3489-0000, and P3448-0000
ARG DEVICE_ID=
ARG NV_USER=
ARG NV_LOGIN_TYPE=devzone
ARG TEMP_USER=dummy
ARG TAG=INVALID
ARG JETPACK_VERSION=4.2
ARG PRODUCT=Jetson
ARG TARGET_OS=Linux
ARG ACCEPT_SDK_LICENCE=accept
RUN mkdir /tmp/${DEVICE_ID}
COPY ./dependencies.Dockerfile /tmp/dependencies.Dockerfile

ENTRYPOINT ["/bin/bash", "-c", "set -e && xvfb-run sdkmanager --cli install --user ${NV_USER} --logintype ${NV_LOGIN_TYPE} --product ${PRODUCT} --version ${JETPACK_VERSION} --targetos ${TARGET_OS} --target ${DEVICE_ID} --flash skip --license ${ACCEPT_SDK_LICENCE} --downloadfolder /tmp/${DEVICE_ID} && sudo docker build -t ${TAG} -f /tmp/dependencies.Dockerfile /tmp/${DEVICE_ID}"] 
