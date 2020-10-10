# Jetson Containers

Running CUDA containers on the Jetson platform

1. [Preface](#preface)
2. [Introduction](#introduction)
3. [Configuration](#configuration)
4. [Building](#building)
5. [Running](#running)
6. [Tensorflow](#tensorflow)
7. [OpenCV](#opencv)
8. [Flashing Devices](#flashing-devices)
9. [Image Sizes](#image-sizes)

## Preface

This project provides a repeatable, containerized approach to building software and libraries to run on the NVIDIA Jetson platform. 

NVIDIA has chosen to break host isolation and use the [NVIDIA Container Runtime](https://github.com/NVIDIA/nvidia-docker/wiki/NVIDIA-Container-Runtime-on-Jetson#usrlocalcuda-is-readonly). NVIDIA's runtime mounts many files (few GB) from the host OS into the container. While they are working on making the containers smaller, it is unknown when this will happen. So while the [NGC L4T containers](https://ngc.nvidia.com/catalog/containers?orderBy=modifiedDESC&pageNumber=0&query=label%3A"l4t") may be smaller, they are loading GBs of data into the container at runtime.

The `jetson-containers` project focuses on containerizing your *entire* application laying out the foundations for:
- Building container images
- Flashing devices
- Installing/compiling 3rd part libraries such as Tensorflow and OpenCV

## Introduction

When building your application and choosing a base, the JetPack images can be trimmed to only include what is needed by your application. This can drastically reduce the size of your images.

These containers enable the OS can be flashed without JetPack having only the main driver pack installed and using less than 1GB storage. The other libraries will be included in the containers enabling migration and updates without involving the host operating system.

When building third party libraries, such as OpenCV and PyTorch, a swapfile will *likely* have to be created in the host OS if compiling on the device. These packages require more memory than the system contains and will crash with very cryptic errors if they run out of memory.

The JetPack base images follow the Nvidia pattern of having `base`, `runtime`, and `devel` images for each device to start from. Additionally, `runtime-cudnn`, `deepstream`, `devel-cudnn`, and `all` images are available as well. You cannot download the JetPack installers without logging in with the SDK manager, so the make tasks herein will automate the download/login through the SDK Manager and save off the device specific packages.

Note: if you have the SDK Manager open, the command line will not work. NVIDIA has incorrectly handled their single instance implementation and the CLI will fail to run.

### Blog

There are several walk through blog posts that may serve as helpful introductions:

- [ARMing Yourself - Working with ARM on x86_64](https://codepyre.com/2019/12/arming-yourself/)
- [Jetson Containers - Introduction](https://codepyre.com/2019/07/jetson-containers-introduction/)
- [Jetson Containers - Samples](https://codepyre.com/2019/07/jetson-containers-samples/)
- [Jetson Containers - Maximizing Jetson Nano Dev Kit Storage](https://codepyre.com/2019/07/maximizing-jetson-nano-storage/)
- [Jetson Containers - Pushing Images to Devices](https://codepyre.com/2019/07/pushing-images-to-devices/)
- [Jetson Containers - Building DeepStream Images](https://codepyre.com/2019/07/building-deepstream-images/)
- [Jetson Containers - Building for CTI Devices](https://codepyre.com/2019/08/building-for-cti-devices/)
- [Jetson Containers - Building Custom Root Filesystems](https://codepyre.com/2019/08/building-custom-root-filesystems/)
- [Jetson Containers - Building Root Filesystems With Desktop UI Support](https://codepyre.com/2019/08/building-root-filesystems-with-desktop-ui-support/)
- [Jetson Containers - Building TensorFlow Object Detection Samples](https://codepyre.com/2019/08/building-tensorflow-object-detection-samples/)


## Configuration

### The .env File

The `Makefile` scripts will import a `.env` file (for an example look at the `.envtemp` file) and export the variables defined.

#### Required

- `REPO` - This is for your own container registry/repo. The builds will take care of the tags and images names. For example `REPO=mycontainers.azurecr.io/l4t`

#### Optional

- `DOCKER` - Allows swapping out for another container runtime such as Moby or Balena. This variable is used in all container operations.
- `DOCKER_HOST` - Setting the `DOCKER_HOST` variable will proxy builds to another machine such as a Jetson device. This allows running the `make` scripts from an `x86_x64` host. This feature was added in November 2018. When using this feature, it is helpful to add your public key to the device's `~/.ssh/authorized_keys` file. This will prevent credential checks on every build.
- `DOCKER_BUILD_ARGS` - Allows adding arguments such as volume mounting or cleanup (`-rm/--squash`) during build operations.
- `DOCKER_DEPS_IMAGE_BUILD_ARGS` - This argument is used for the driver pack and Tensorflow build commands. The default will squash as our base images which need to copy from a dependencies image. Without this the images will be massive.
- `DOCKER_RUN_ARGS` - Allows adding arguments such as environment variables, mounts, network configuration, etc when running images. Can also be used to configure X11 forwarding.

### Docker

Storing these images will also require significant disk space. It is highly recommended that an NVME or other hard drive is installed and mounted at boot through `fstab`. Once mounted, configure your container runtime to store its containers and images there. You'll also want to enable the experimental features to get `--squash` available during builds. This can be turned off by manually specifying `DOCKER_BUILD_ARGS`.

`/etc/docker/daemon.json`
```json
{
    "data-root": "/some/external/docker",
    "experimental": true
}
```

## Building

The project uses `make` to set up the dependent builds constructing the final images. The recipes fall into a few categories:

- Driver packs (32.4.3, 32.3.1, 32.2.1, 32.2, 32.1)
- JetPack Dependencies (4.4, 4.3, 4.2.2, 4.2.1, 4.2)
- JetPack (4.4, 4.3, 4.2.2, 4.2.1, 4.2)
- Devices (jax (xavier), nx, tx2, tx1, nano)
- Flashing containers
- OpenCV (4.1.0)

### Dependencies

The JetPack dependency builds must be run on an `x86_64` host. They can be built with `make <device>-jetpack-<jetpack-version>-deps`. This will build an image using files downloaded from the SDK Manager installed. As the container runs, click the link and log into your nvidia account in the web browser. Once built, push the image to your container registry so that the device can leverage it all other builds. This may sound like a lot, but it is really just:

- Make sure `DOCKER_HOST`, if set, is pointing to an `x86_64` host
- `make jax-jetpack-4.4-deps`, or `make nano-dev-jetpack-4.4-deps`, or `make tx2-jetpack-4.4-deps`, or `make jetpack-4.4-deps` to build them all
- The login prompt can be skipped if you open the SDK Manager and cache your credentials when logging in. Ensure that the SDK Manager is closed before using the CLI.
- Upload finished image(s) to your container registry

All other steps for JetPack require these previous steps to have been completed.

#### CTI Dependencies

CTI has a board support package which must be installed into the rootfs. When building flash images for CTI boards, there are three options:

1. Run `~/jetson-containers$ make cti-<driver pack>-<device>-deps` such as `~/jetson-containers$ make cti-32.1-tx2-deps` which will download the BSP and generate an image `l4t:cti-32.1-tx2-deps` with the driver pack installed into `/data`.
2. Download the BSP from the CTI web site and save it to an empty folder. In the `.env` file, set the `SDKM_DOWNLOADS` to this folder and run `~/jetson-containers$ make cti-<driver pack>-<device>-deps-from-folder`. For example: `~/jetson-containers$ make cti-32.1-tx2-deps-from-folder` which will generate an image `l4t:cti-32.1-tx2-deps` with the driver pack installed into `/data`.
3. Download the BSP into the folder with the downloads from the SDK Manager. In the `.env` file, set the `SDKM_DOWNLOADS` to the chosen folder. Run `~/jetson-containers$ make <device>-jetpack-<version>-deps-from-folder`. For example: `~/jetson-containers$ make tx2-jetpack-4.2-deps-from-folder` which will generate an image `l4t:tx2-jetpack-4.2-deps` with the BSP and JetPack dependencies installed into `/data`. 

For all of these, open your `.env` and set `BSP_DEPENDENCIES_IMAGE` to the dependency image created. In the last example it will be the same image as the `DEPENDENCIES_IMAGE` setting found in the `/cti/<version>/drivers/*.conf` file associated with the image being flashed.

### Driver Packs

The driver packs form the base of the device images. Each version of JetPack is built on top of a driver pack. To build an image, follow the pattern:

`make <driver-pack>-<device>-jetpack-<jetpack-version>`

Note: not all combinations are valid and the `Makefile` should have all valid combinations declared.
Note: if these command's are not run on the device, the `DOCKER_HOST` variable must be set.
Note: from 4.2, building Jetson containers on the host is also supported: leave the `DOCKER_HOST` empty and make sure [qemu-user-static](https://github.com/multiarch/qemu-user-static) is installed and interpreters are registered on the host. If not, please run:

```bash
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-user-static binfmt-support
```

examples:

```bash
make driver-packs # build all driver pack bases
make jetpack-4.4 # build all JetPack 4.4. device builds and the driver packs they depend on
make 32.3.1-jax-jetpack-4.3
make 32.4.3-nx-jetpack-4.4
```

There are additional recipes for building the samples container for any given jetpack/device (`make 32.4.3-nx-jetpack-4.4-samples`) and running the container (`make run-32.4.3-nx-jetpack-4.4-samples`) which demonstrates mult-stage builds. Note: In order to run the image you must be on the device or have set the `DOCKER_HOST` variable in the `.env` file.

## Running

To run a container with GPU support there are a couple options. First, not recommended, run with the `--privileged` option.

Another option is to add the host's GPUs to the container. Depending on your application you may need to add other othe devices such as `/dev/tegra_dc_ctrl`:

```bash
docker run \
    --device=/dev/nvhost-ctrl \
    --device=/dev/nvhost-ctrl-gpu \
    --device=/dev/nvhost-prof-gpu \
    --device=/dev/nvmap \
    --device=/dev/nvhost-gpu \
    --device=/dev/nvhost-as-gpu \
    --device=/dev/nvhost-vic \
    <image-name>
```

Starting in [API 1.40](https://docs.docker.com/config/containers/resource_constraints/#access-an-nvidia-gpu) the `--gpus` options was added. This requires that the NVIDIA conatiner runtime is installed as Docker/Moby will query the driver:

```bash
docker run --gpus all <image-name>
```

With Azure IoT Edge, the following be specified in the deployment manifest if you don't want to mount all of the devices listed above:

```json
"createOptions": {
    "HostConfig": {
        "DeviceRequests": [
            {
                "Capabilities": [
                    "gpu"
                ],
                "Cound": -1
            }
        ]
    }
}
```

### X11 Forwarding

Running containerized applications with X11 forwarding requires simple configuration changes

- On the host OS, run `xhost +`
- Add `--net=host` and `-e "DISPLAY"` arguments to docker

The `DOCKER_RUN_ARGS` variable can be set in the `.env` file to `DOCKER_RUN_ARGS=--net=host -e "DISPLAY"` which will set up the forwarding when using `make`. Then run the `run-32.1-jax-jetpack-4.2-samples` task. This works for both local and remote sessions leveraging `DOCKER_HOST`. Note that when using `DOCKER_HOST` the forwarding will be done on the target and not forwarded locally.

## Tensorflow

Tensorflow builds have been added to all jetpack/device combinations. The commands to build them follow the pattern:

`make <driver-pack>-<device>-jetpack-<jetpack-version>-tf-<tensorflow version>-nv<nv version>-<target>`

- The Tensorflow and NV versions are found by browsing the [NVIDIA Tensorflow index](https://developer.download.nvidia.com/compute/redist/jp/)
- Where `target` is one of `min`, `runtime`, `runtime-tensorrt`, and `devel`. 

Examples
```bash
make 32.4.3-jax-jetpack-4.4-tf-2.2.0-nv20.8-min
make 32.2.3-tx2-jetpack-4.2.3-tf-1.13.1-nv19.4-runtime-tensorrt
```

## OpenCV

Building OpenCV can take a few hours depending on your device and performance mode. When the OpenCV builds are complete, the install `.sh` file can be found in the `/dist` folder.

### Building Custom OpenCV

```
make opencv-4.0.1-l4t-32.1-jetpack-4.2
```

## Flashing Devices

Flashing devices usually requires installation of JetPack. To make this easier and more repeatable, you can now flash your device using a container. 

There are default profiles which match the device and JetPack versions in the `flash/jetpack-bases` folder. Once the image is created, you have a versionable image which will be the base OS and drivers for your device. 

Examples:
```bash
make image-jetpack # create all jetpack default configuration images for flashing.
make image-32.2-tx2i-jetpack-4.2.1 # JetPack 4.2.1 for TX2i with driver pack 32.2
make image-32.1-jax-jetpack-4.2 # JetPack 4.2 for Xavier with driver pack 32.1
```

Note: Ensure that if the `DOCKER_HOST` variable is set, the host specified must be `x86_64`.
Note: The `Dockerfile`s can be modified to chroot the rootfs folder customizing the image such as setting up `cloud-init`.

To flash the device, put the device into recovery mode and connect it to the host via USB cable. You can follow the instructions from your device instructions, or run `reboot recovery` from a terminal session on the device. Now, run `./flash.sh` along with the image tag you want to execute. For example, looking at images previously built:

```bash
>:~/jetson-containers/flash$ docker images
REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
l4t:32.1-jax-jetpack-4.2-image     latest              e59950b4ebdc        5 hours ago         3.73GB
```

We can flash the Xavier with the default JetPack 4.2 configuration by executing `./flash.sh l4t:32.1-jax-jetpack-4.2-image`. If your device is not in recovery mode, you will see an error similar to:

```
###############################################################################
# L4T BSP Information:
# R31 (release), REVISION: 1.0, GCID: 13194883, BOARD: t186ref, EABI: aarch64, 
# DATE: Wed Oct 31 22:26:16 UTC 2018
###############################################################################
Error: probing the target board failed.
       Make sure the target board is connected through 
       USB port and is in recovery mode.
```

If your device was in recovery mode, you should see progress displayed. Once the device has been flashed, it will automatically restart.

### CTI BSPs Flashing

1. Build BSP dependencies image
2. Build JetPack dependencies image
3. Build flashing image

Example: Building Orbitty

```bash
>:~/jetson-containers/$ make cti-32.1-tx2-125-deps
>:~/jetson-containers/$ make 32.1-tx2-jetpack-4.2-deps
>:~/jetson-containers/$ make image-cti-32.1-v125-orbitty
>:~/jetson-containers/$ ./flash/flash.sh l4t:cti-32.1-v125-orbitty-image
```

If you want to use a different dependency image for the BSP, set `BSP_DEPENDENCIES_IMAGE` in the `.env` file.

## Image sizes

### Base

| Repository | Tag | Size |
|---|---|---|
| arm64v8/ubuntu | bionic | 56.7MB |

### Jetson

#### Dependency packs:

Note that these are only used on build machines.

| Repository | Driver | Size |
|---|---|---|
| l4t | 32.4.3-***-jetpack-4.4-deps | ~4.56GB |
| l4t | 32.3.1-***-jetpack-4.3-deps | ~3.96GB |
| l4t | 32.2.1-***-jetpack-4.2.2-deps | ~3.5GB |
| l4t | 32.2-***-jetpack-4.2.1-deps | ~3.5GB |
| l4t | 32.1-***-jetpack-4.2-deps | ~3.30GB |

#### Driver packs:

| Repository | Driver | Size |
|---|---|---|
| l4t | 32.4.3-*** | ~786MB |
| l4t | 32.3.1-*** | ~765MB |
| l4t | 32.2.1-*** | ~460MB |
| l4t | 32.2-*** | ~470MB |
| l4t | 32.1-*** | ~470MB |

#### JetPack 4.4

| Repository | Tag | Size |
|---|---|---|
| l4t | 32.4.3-***-jetpack-4.4-base | ~788MB |
| l4t | 32.4.3-***-jetpack-4.4-runtime | ~1.87GB |
| l4t | 32.4.3-***-jetpack-4.4-runtime-cudnn | ~2.67GB |
| l4t | 32.4.3-***-jetpack-4.4-deepstream | ~6.69GB |
| l4t | 32.4.3-***-jetpack-4.4-devel | ~4.04GB |
| l4t | 32.4.3-***-jetpack-4.4-devel-cudnn | ~6.44GB |
| l4t | 32.4.3-***-jetpack-4.4-all | ~8.07GB |
| l4t | 32.4.3-***-jetpack-4.4-samples | ~3.05GB |
|---|---|---|
|   | Tensorflow | |
| l4t | 32.4.3-***-jetpack-4.4-tf-2.2.0-nv20.7-min | ~2.95GB |
| l4t | 32.4.3-***-jetpack-4.4-tf-2.1.0-nv20.4-min | ~2.81GB |
| l4t | 32.4.3-***-jetpack-4.4-tf-1.15.3-nv20.7-min | ~2.64GB |

#### JetPack 4.3

| Repository | Tag | Size |
|---|---|---|
| l4t | 32.3.1-***-jetpack-4.3-base | ~768MB |
| l4t | 32.3.1-***-jetpack-4.3-runtime | ~1.5GB |
| l4t | 32.3.1-***-jetpack-4.3-runtime-cudnn | ~1.97GB |
| l4t | 32.3.1-***-jetpack-4.3-deepstream | ~3.9GB |
| l4t | 32.3.1-***-jetpack-4.3-devel | ~3.45GB |
| l4t | 32.3.1-***-jetpack-4.3-devel-cudnn | ~4.35GB |
| l4t | 32.3.1-***-jetpack-4.3-all | ~5.92GB |
| l4t | 32.3.1-***-jetpack-4.3-samples | ~2.63GB |

#### JetPack 4.2.2

| Repository | Tag | Size |
|---|---|---|
| l4t | 32.2.1-***-jetpack-4.2.2-base | ~470MB |
| l4t | 32.2.1-***-jetpack-4.2.2-runtime | ~1.23GB |
| l4t | 32.2.1-***-jetpack-4.2.2-devel | ~5.78GB |


#### JetPack 4.2.1

| Repository | Tag | Size |
|---|---|---|
| l4t | 32.2-***-jetpack-4.2.1-base | ~475MB |
| l4t | 32.2-***-jetpack-4.2.1-runtime | ~1.23GB |
| l4t | 32.2-***-jetpack-4.2.1-devel | ~5.8GB |


#### JetPack 4.2

| Repository | Tag | Size |
|---|---|---|
| l4t | 32.1-***-jetpack-4.2-base | ~489MB |
| l4t | 32.1-***-jetpack-4.2-runtime | ~1.2GB |
| l4t | 32.1-***-jetpack-4.2-devel | ~5.65GB |
| l4t | 32.1-***-jetpack-4.2-samples | ~2.3GB |
