# JetsonContainers
Running CUDA containers on the Jetson platform

1. [Preface](#preface)
2. [Docker](#docker)
3. [Building](#building)
4. [Running](#running)
5. [OpenCV](#opencv)
6. [Flashing Devices](#flashing-devices)
7. [Image Sizes](#image-sizes)


## Preface

Each image, whether Linux for Tegra (L4T) or JetPack based provides args for the `URL` to pull installers from. Once the JetPack installer has been run, copy the packages to your own source for downloading. This will likely increase your download speed and allow building images if the package URLs ever change. Staring in JetPack 4.2, you cannot download the JetPack installers without logging in with the SDK manager.

When building your application and choosing a base, the JetPack images can be trimmed to only include what is needed by your application. This can drastically reduce the size of your images. The JetPack 4.2 base images follow the Nvidia pattern of having base, runtime, and devel images to start from.

With these containers, the OS can be flashed without JetPack with only the main driver pack installed. The other libraries will be contained in the containers and enables migration and updates without involving the base operating system.

When building third party libraries, such as OpenCV and PyTorch, a swapfile will likely have to be created in the host OS. These packages require more memory than the system contains and will crash with very cryptic errors if they run out of memory.

The `Makefile` scripts will import a `.env` file (for an example look at the `.envtemp` file) and export the variables defined. Setting the `DOCKER_HOST` variable will proxy builds to another machine such as a Jetson device. This allows running the `make` scripts from an `x86_x64` host. 

## Docker

When using containers, it is highly recommended that you use external storage and configure your container runtime to use that storage as its data root. For example, with Docker:

`/etc/docker/daemon.json`
```json
{
    "data-root": "/some/external/docker"
}
```

## Building

The project using `make` to set up the dependent builds constructing the final images. The recipes fall into a few categories:

- Driver packs (32.1, 31.,1 28.3, 28.2.1, 28.2, 28.1)
- JetPack (4.2, 4.1.1, 3.3, 3.2.1)
- Devices (jax (xavier), tx2, tx1, nano)
- Flashing containers
- OpenCV (4.0.1)

The driver packs form the base of the device images. Each version of JetPack is built on top a driver pack. To build an image, follow the pattern:

`make <driver-pack>-<device>-jetpack-<jetpack-version>`

Note: not all combinations are valid and the `Makefile` should have all valid combinations declared.
Note: if these command's are not run on the device, the `DOCKER_HOST` variable must be set.

examples:

```bash
make driver-packs # build all driver pack bases
make jetpack-4.2 # build all JetPack 4.2. device builds and the driver packs they depend on
make 32.1-jax-jetpack-4.2
make 28.3-tx2-jetpack-3.3
make 28.2.1-tx2-jetpack-3.2.1
make 28.2-tx1-jetpack-3.2.1
```

There are additional recipes for building the `32.1-jax-jetpack-4.2` samples container `make build-32.1-jax-jetpack-4.2-samples` and running the container `make run-32.1-jax-jetpack-4.2-samples` which demonstrates mult-stage builds based on `devel` images.

There are two more targets `flash-%` and `opencv-%` which will proxy the commands to the other `Makefile`s. See their `readme`s for more information.

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

## OpenCV

### Building OpenCV

opencv-4.0.1-l4t-32.1-jax-jetpack-4.2
opencv-4.0.1-l4t-32.1-tx2-jetpack-4.2
opencv-4.0.1-l4t-28.3-tx2-jetpack-3.3

## Flashing Devices

Flashing devices usually requires installation of JetPack. To make this easier and more repeatable, you can now flash your device using a container. 

There are default profiles which match the device and JetPack versions in the `flash/jetpack-bases` folder. Once the image is created, you have a versionable image which will be the base OS and drivers for your device. 

Examples:
```bash
make flash-bionic-server-20190402 # Set up an image which can flash bionic server to the device
make flash-jetpack-bases # create all jetpack default configuration images for flashing.
make flash-l4t-28.3-tx2-jetpack-3.3-base # JetPack 3.3 for TX2 with driver pack 28.3
make flash-l4t-32.1-jax-jetpack-4.2-base # JetPack 4.2 for Xavier with driver pack 32.1
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
| arm64v8/ubuntu | bionic-20190307 | 80.4MB |
| arm64v8/ubuntu | xenial-20190222 | 108MB |

### Jetson

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
| l4t | 32.1-nano | 469MB |
| l4t | 32.1-tx2 | 479MB |

#### JetPack 4.2

| Repository | Tag | Size |
|---|---|---|
| l4t | 32.1-jax-jetpack-4.2-base | 493MB |
| l4t | 32.1-jax-jetpack-4.2-runtime | 1.21GB |
| l4t | 32.1-jax-jetpack-4.2-devel | 5.72GB |
| l4t | 32.1-jax-jetpack-4.2-samples | 6.54GB |
| l4t | 32.1-nano-jetpack-4.2-base | 483MB |
| l4t | 32.1-nano-jetpack-4.2-runtime | 1.2GB |
| l4t | 32.1-nano-jetpack-4.2-devel | 5.71GB |
| l4t | 32.1-tx2-jetpack-4.2-base | 493MB |
| l4t | 32.1-tx2-jetpack-4.2-runtime | 1.21GB |
| l4t | 32.1-tx2-jetpack-4.2-devel | 5.72GB |

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
