
ARG IMAGE_NAME
FROM ${IMAGE_NAME}:32.3.1-tx2-4gb

LABEL com.nvidia.jetpack.version="4.3"

ENV CUDA_VERSION "10.0.326"

LABEL com.nvidia.cuda.version="${CUDA_VERSION}"

RUN apt-get update && \
    apt-get install -y --no-install-recommends --allow-downgrades cuda-cudart-10-0 cuda-nvtx-10-0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH} && \
    export LIBRARY_PATH=/usr/local/cuda/lib64/stubs && \
    grep -q "export PATH=.*/usr/local/cuda/bin" ~/.bashrc || echo "export PATH=/usr/local/cuda/bin:$PATH">>~/.bashrc && \
    grep -q "export LD_LIBRARY_PATH=/usr/local/cuda/lib64" ~/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc && \
    grep -q "export PATH=.*/usr/local/cuda/bin" /etc/skel/.bashrc || echo "export PATH=/usr/local/cuda/bin:$PATH">>/etc/skel/.bashrc && \
    grep -q "export LD_LIBRARY_PATH=/usr/local/cuda/lib64" /etc/skel/.bashrc || echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH" >> /etc/skel/.bashrc

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all