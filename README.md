# Jetson Containers

Running CUDA containers on the Jetson platform

1. [Preface](#preface)
2. [Introduction](#introduction)
3. [Configuration](#configuration)
4. [Building](#building)
5. [Running](#running)
6. [OpenCV](#opencv)
7. [Flashing Devices](#flashing-devices)
8. [Image Sizes](#image-sizes)

## Preface

This project provides a repeatable, containerized approach to building software and libraries to run on the Nvidia Jetson platform.

## Introduction

When building your application and choosing a base, the JetPack images can be trimmed to only include what is needed by your application. This can drastically reduce the size of your images.

These containers enable the OS can be flashed without JetPack having only the main driver pack installed. The other libraries will be included in the containers enabling migration and updates without involving the host operating system.

When building third party libraries, such as OpenCV and PyTorch, a swapfile will *likely* have to be created in the host OS. These packages require more memory than the system contains and will crash with very cryptic errors if they run out of memory.

### JetPack 4.2

The JetPack 4.2 base images follow the Nvidia pattern of having base, runtime, and devel images for each device to start from. Staring in JetPack 4.2, you cannot download the JetPack installers without logging in with the SDK manager, so the make tasks herein will automate the download/login through the SDK Manager and save off the device specific packages.

### Older

Each image, whether Linux for Tegra (L4T) or JetPack based provides args for the `URL` to pull installers from. Once the JetPack installer has been run, copy the packages to your own source for downloading. This will likely increase your download speed and allow building images if the package URLs ever change. This could be automated to follow the pattern used in 4.2+, but it is a lot of effort at the moment.

## Configuration

### The .env File

The `Makefile` scripts will import a `.env` file (for an example look at the `.envtemp` file) and export the variables defined.

- `REPO` - This is for your own container registry/repo. The builds will take care of the tags and images names. For example `REPO=mycontainers.azurecr.io/l4t`
- `NV_USER` - Sets the email address to be used when authenticating with the SDK Manager. This isn't stored and you'll be prompted for your password when the container runs.
- `DOCKER` - Allows swapping out for another container runtime such as Moby or Balena. This variable is used in all container operations.
- `DOCKER_HOST` - Setting the `DOCKER_HOST` variable will proxy builds to another machine such as a Jetson device. This allows running the `make` scripts from an `x86_x64` host. This feature was added in November 2018. When using this feature, it is helpful to add your public key to the device's `~/.ssh/authorized_keys` file. This will prevent credential checks on every build.
- `DOCKER_BUILD_ARGS` - Allows adding arguments such as volume mounting or cleanup (`-rm/--squash`) during build operations.
- `DOCKER_RUN_ARGS` -  Allows adding arguments such as environment variables, mounts, network configuration, etc when running images. Can also be used to configure X11 forwarding.
- `DOCKER_CONTEXT` - Defaults to `.` but can be overridden in some circumstances for testing.

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

- Driver packs (32.1, 31.,1 28.3, 28.2.1, 28.2, 28.1)
- JetPack Dependencies (4.2)
- JetPack (4.2, 4.1.1, 3.3, 3.2.1)
- Devices (jax (xavier), tx2, tx1, nano-dev)
- Flashing containers
- OpenCV (4.0.1)

### Dependencies

The JetPack dependency builds must be run on an `x86_64` host. They can be built with `make <device>-jetpack-<jetpack-version>-deps`. This will build an image using files downlaoded from the SDK Manager installed. Building this image will require authentication and `NV_USER` should be set in your `.env` file. As the container runs, enter your password when prompted. For `sudo` prompts, enter `pass` as the password. Once built, push the image to your container registry so that the device can leverage it all other builds. This may sound like a lot, but it is really just:

- Set `NV_USER` in the `.env` file
- Make sure `DOCKER_HOST`, if set, is pointing to an `x86_64` host
- `make jax-jetpack-4.2-deps`, or `make nano-dev-jetpack-4.2-deps`, or `make tx2-jetpack-4.2-deps`, or `make jetpack-4.2-deps` to build them all
- Wait, then enter your Nvidia developer password when prompted
- Enter `pass`
- Enter `pass`
- Upload finished image to your container registry

All other steps for JetPack 4.2+ require these previous steps to have been completed.

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
make jetpack-4.2 # build all JetPack 4.2. device builds and the driver packs they depend on
make 32.1-jax-jetpack-4.2
make 28.3-tx2-jetpack-3.3
make 28.2.1-tx2-jetpack-3.2.1
make 28.2-tx1-jetpack-3.2.1
```

There are additional recipes for building the `32.1-jax-jetpack-4.2` samples container (`make build-32.1-jax-jetpack-4.2-samples`) and running the container (`make run-32.1-jax-jetpack-4.2-samples`) which demonstrates mult-stage builds based on `devel` images.

## Running

To run a container with GPU support there are two options. First, not recommended, run with the `--privileged` option. Second, recommended option, is to add the host's GPUs to the container:

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

### X11 Forwarding

Running containerized applications with X11 forwarding requires simple configuration changes

- On the host OS, run `xhost +`
- Add `--net=host` and `-e "DISPLAY"` arguments to docker

The `DOCKER_RUN_ARGS` variable can be set in the `.env` file to `DOCKER_RUN_ARGS=--net=host -e "DISPLAY"` which will set up the forwarding when using `make`. Then run the `run-32.1-jax-jetpack-4.2-samples` task. This works for both local and remote sessions leveraging `DOCKER_HOST`. Note that when using `DOCKER_HOST` the forwarding will be done on the target and not forwarded locally.

## OpenCV

Building OpenCV can take a few hours depending on your device and performance mode. When the OpenCV builds are complete, the install `.sh` file can be found in the `/dist` folder.

### Building OpenCV

```
make opencv-4.0.1-l4t-32.1-jetpack-4.2
make opencv-4.0.1-l4t-28.3-jetpack-3.3
```

## Flashing Devices

Flashing devices usually requires installation of JetPack. To make this easier and more repeatable, you can now flash your device using a container. 

There are default profiles which match the device and JetPack versions in the `flash/jetpack-bases` folder. Once the image is created, you have a versionable image which will be the base OS and drivers for your device. 

Examples:
```bash
make image-bionic-server-20190402 # Set up an image which can flash bionic server to the device
make image-jetpack-bases # create all jetpack default configuration images for flashing.
make image-l4t-28.3-tx2-jetpack-3.3-base # JetPack 3.3 for TX2 with driver pack 28.3
make image-l4t-32.1-jax-jetpack-4.2-base # JetPack 4.2 for Xavier with driver pack 32.1
```

Note: Ensure that if the `DOCKER_HOST` variable is set, the host specified must be `x86_64`.
Note: The `Dockerfile`s can be modified to chroot the rootfs folder customizing the image such as setting up `cloud-init`.

To flash the device, put the device into recovery mode and connect it to the host via USB cable. You can follow the instructions from your device instructions, or run `reboot recovery` from a terminal session on the device. Now, run `./flash.sh` along with the image tag you want to execute. For example, looking at images previously built:

```bash
>:~/jetson-containers/flash$ docker images
REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
l4t:28.3-tx2-jetpack-3.3-base        latest              cc58f9478aa2        22 hours ago        3.35GB
l4t:32.1-jax-jetpack-4.2-base     latest              e59950b4ebdc        5 hours ago         3.73GB
```

We can flash the Xavier with the default JetPack 4.2 configuration by executing `./flash.sh l4t-32.1-jax-jetpack-4.2-base`. If your device is not in recovery mode, you will see an error similar to:

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

## Image sizes

### Base

| Repository | Tag | Size |
|---|---|---|
| arm64v8/ubuntu | bionic-20190612 | 80.4MB |
| arm64v8/ubuntu | xenial-20190610 | 108MB |

### Jetson

#### Dependency packs:

Note that these are only used on build machines.

| Repository | Driver | Size |
|---|---|---|
| l4t | jax-jetpack-4.2.1-deps | 3.57GB |
| l4t | jax-jetpack-4.2-deps | 3.32GB |
| l4t | nano-dev-jetpack-4.2-deps | 3.31GB |
| l4t | tx2-jetpack-4.2-deps | 3.31GB |

#### Driver packs:

| Repository | Driver | Size |
|---|---|---|
| l4t | 28.1-tx1 | 371MB |
| l4t | 28.1-tx2 | 435MB |
| l4t | 28.2.1-tx2 | 460MB |
| l4t | 28.2-tx1 | 414MB |
| l4t | 28.3-tx1 | 459MB |
| l4t | 28.3-tx2 | 551MB |
| l4t | 31.1-jax | 370MB |
| l4t | 32.1-jax | 479MB |
| l4t | 32.1-nano-dev | 469MB |
| l4t | 32.1-tx2 | 479MB |
| l4t | 32.2-jax | 493MB |

#### JetPack 4.2.1

| Repository | Tag | Size |
|---|---|---|
| l4t | 32.2-jax-jetpack-4.2.1-base | 503MB |
| l4t | 32.2-jax-jetpack-4.2.1-runtime | 1.26GB |
| l4t | 32.2-jax-jetpack-4.2.1-devel | 5.83GB |

#### JetPack 4.2

| Repository | Tag | Size |
|---|---|---|
| l4t | 32.1-jax-jetpack-4.2-base | 489MB |
| l4t | 32.1-jax-jetpack-4.2-runtime | 1.23GB |
| l4t | 32.1-jax-jetpack-4.2-devel | 5.69GB |
| l4t | 32.1-jax-jetpack-4.2-samples | 2.32GB |
| l4t | 32.1-nano-dev-jetpack-4.2-base | 479MB |
| l4t | 32.1-nano-dev-jetpack-4.2-runtime | 1.2GB |
| l4t | 32.1-nano-dev-jetpack-4.2-devel | 5.66GB |
| l4t | 32.1-tx2-jetpack-4.2-base | 489MB |
| l4t | 32.1-tx2-jetpack-4.2-runtime | 1.21GB |
| l4t | 32.1-tx2-jetpack-4.2-devel | 5.67GB |

#### JetPack 4.1.1

| Repository | Tag | Size |
|---|---|---|
| l4t | 31.1-jax-jetpack-4.1.1 | 5.61GB |

#### JetPack 3.3

| Repository | Tag | Size |
|---|---|---|
| l4t | 28.3-tx1-jetpack-3.3 | 4.48GB |
| l4t | 28.3-tx2-jetpack-3.3 | 4.58GB |
| l4t | 28.2.1-tx2-jetpack-3.3 | 4.47GB |
| l4t | 28.2-tx1-jetpack-3.3 | 4.43GB |

#### JetPack 3.2.1

| Repository | Tag | Size |
|---|---|---|
| l4t | 28.3-tx1-jetpack-3.2.1 | 4.09GB |
| l4t | 28.3-tx2-jetpack-3.2.1 | 4.18GB |
| l4t | 28.2.1-tx2-jetpack-3.2.1 | 4.08GB |
| l4t | 28.2-tx1-jetpack-3.2.1 | 4.03GB |
