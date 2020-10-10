
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.4.3-tx2-4gb

LABEL com.nvidia.jetpack.version="4.4"

ENV CUDA_VERSION "10.2.89"

LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

RUN apt-get update && \
    apt-get install -y --no-install-recommends --allow-downgrades cuda-cudart-10-2 cuda-nvtx-10-2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/local/cuda-10.2 /usr/local/cuda && \
    ln -s /usr/local/cuda-10.2/targets/aarch64-linux/include /usr/local/cuda/include && \
    ln -s /usr/local/cuda-10.2/targets/aarch64-linux/lib /usr/local/cuda/lib64

RUN echo "/usr/lib/aarch64-linux-gnu/tegra" >> /etc/ld.so.conf.d/nvidia-tegra.conf && \
    echo "/usr/lib/aarch64-linux-gnu/tegra-egl" >> /etc/ld.so.conf.d/nvidia-tegra.conf && \
    echo "/usr/local/cuda-10.2/targets/aarch64-linux/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    ldconfig

RUN export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH} && \
    export LIBRARY_PATH=/usr/local/cuda/lib64/stubs && \
    grep -q "export PATH=.*/usr/local/cuda/bin" ~/.bashrc || echo "export PATH=/usr/local/cuda/bin:$PATH">>~/.bashrc && \
    grep -q "export LD_LIBRARY_PATH=/usr/local/cuda/lib64" ~/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc && \
    grep -q "export PATH=.*/usr/local/cuda/bin" /etc/skel/.bashrc || echo "export PATH=/usr/local/cuda/bin:$PATH">>/etc/skel/.bashrc && \
    grep -q "export LD_LIBRARY_PATH=/usr/local/cuda/lib64" /etc/skel/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> /etc/skel/.bashrc

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all