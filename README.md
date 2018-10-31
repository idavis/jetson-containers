# JetsonContainers
Running CUDA containers on the Jetson platform

1. [Preface](#preface)
2. [Docker](#docker)
3. [Running](#running)
4. [Image Sizes](#image-sizes)

## Preface

Each image, whether Linux for Tegra (L4T) or JetPack based provides args for the `URL` to pull installers from. Once the JetPack installer has been run, copy the packages to your own source for downloading. This will likely increase your download speed and allow building images if the package URLs ever change.

When building your application and choosing a base, the JetPack images can be trimmed to only include what is needed by your application. This can drastically reduce the size of your images.

With these containers, the OS can be flashed without JetPack with only the main driver pack installed. The other libraries will be contained in the containers and enables migration and updates without involving the base operating system.

When building third party libraries, such as OpenCV and PyTorch, a swapfile will have to be created in the host OS. These packages require more memory than the system contains and will crash with very cryptic errors if they run out of memory.

When using containers, it is highly recommended that you use external storage and configure your container runtime to use that storage as its data root. For example, with Docker:

`/etc/docker/daemon.json`
```json
{
    "data-root": "/some/external/docker"
}
```

## Docker

1. Set Up the Docker Repository
    ```bash
    sudo apt-get update
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    ```
2. Install Docker CE
    ```bash
    # Do not skip this update, we added an apt-repo in the last step which we need to pull from.
    sudo apt-get update
    sudo apt-get install docker-ce
    ```
3. Verify Installation
    ```bash
    sudo docker run hello-world
    ```

## Running

```bash
docker run \
    --device=/dev/nvhost-ctrl \
    --device=/dev/nvhost-ctrl-gpu \
    --device=/dev/nvmap \
    --device=/dev/nvhost-gpu \
    --device=/dev/nvhost-vic \
    <image-name>
```

## Image sizes

### Base

arm64v8/ubuntu:xenial-20180808 => 106 MB

### Jetson

#### File System with Driver Pack

l4t:28.1-tx1 => 370 MB

l4t:28.1-tx2 => 433 MB

l4t:28.2-tx1 => 412 MB

l4t:28.2.1-tx2 => 458 MB

#### With Jetpack

l4t:28.2-tx1-jetpack-3.2.1 => 4.03 GB

l4t:28.2-tx1-jetpack-3.3 => 4.43 GB

l4t:28.2.1-tx2-jetpack-3.2.1 => 4.48 GB

l4t:28.2.1-tx2-jetpack-3.3 => 4.07 GB

