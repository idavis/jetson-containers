# JetsonContainers
Running CUDA containers on the Jetson platform

1. [Preface](#preface)
2. [Docker](#docker)
3. [Running](#running)
4. [Image Sizes](#image-sizes)
5. [Flashing Devices](#flashing-devices)

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

l4t:31.1-xavier => 362 MB

#### With Jetpack

l4t:28.2-tx1-jetpack-3.2.1 => 4.03 GB

l4t:28.2-tx1-jetpack-3.3 => 4.43 GB

l4t:28.2.1-tx2-jetpack-3.2.1 => 4.48 GB

l4t:28.2.1-tx2-jetpack-3.3 => 4.07 GB

l4t:31.1-xavier-jetpack-4.1.1 => 5.61 GB

## Flashing Devices

Flashing devices usually requires installation of JetPack. To make this easier and more repeatable, you can now flash your device using a container. 

From the `flash` directory, run `build.sh` to create a container capable of flashing your device. There are default profiles which match the device and JetPack versions in the `flash/jetpack-bases` folder. For example, to create an image to flash JetPack 3.3 for TX2, run `./build.sh jetpack-bases/l4t-28.2.1-tx2-jetpack-3.3-base`. To create an image to flash JetPack 4.1.1 for Xavier, `./build.sh jetpack-bases/l4t-31.1-xavier-jetpack-4.1.1-base`. Once the image is created, you have a versionable image which will be the base OS and drivers for your device.

To flash the device, put the device into recovery mode and connect it to the host via USB cable. Now, run `./flash.sh` along with the image tag you want to execute. For example, looking at images previously built:

```
>:~/JetsonContainers/flash$ docker images
REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
l4t-28.2.1-tx2-jetpack-3.3-base      latest              cc58f9478aa2        22 hours ago        3.35GB
l4t-31.1-xavier-jetpack-4.1.1-base   latest              e59950b4ebdc        5 hours ago         3.73GB
```

We can flash the Xavier with the default JetPack 4.1.1 configuration by executing `./flash.sh l4t-31.1-xavier-jetpack-4.1.1-base`. If your device is not in recovery mode, you will see an error similar to:

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

