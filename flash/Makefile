#!make

# Default squash as our base images need to be small unless overridden
export DOCKER_BUILD_ARGS ?= --squash

# Allow override for moby or another runtime
export DOCKER ?= docker

export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)

# Used for creating the flashing container.
export VERSION_ID ?= bionic-20190307

# Allow additional options such as --squash
# DOCKER_BUILD_ARGS ?= ""
export DOCKER_CONTEXT ?= .

.PHONY: all

all: jetpack-image

jetpack-image: jetpack-4.2.1-image jetpack-4.2-image

jetpack-4.2-image: 32.1-nano-dev-jetpack-4.2-image 32.1-tx2-jetpack-4.2-image 32.1-jax-jetpack-4.2-image

jetpack-4.2.1-image: 32.2-jax-jetpack-4.2.1-image 32.2-tx2-jetpack-4.2.1-image 32.2-tx2i-jetpack-4.2.1-image 32.2-tx2-4gb-jetpack-4.2.1-image 32.2-tx1-jetpack-4.2.1-image 32.2-nano-dev-jetpack-4.2.1-image 32.2-nano-jetpack-4.2.1-image 

32.1-%-jetpack-4.2-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/l4t/32.1" $(CURDIR)/build.sh ./conf/$@ $(REPO):$@)

32.2-%-jetpack-4.2.1-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/l4t/32.2" $(CURDIR)/build.sh ./conf/$@ $(REPO):$@)

32.1-cti-v203-image: $(addsuffix -image,$(addprefix 32.1-cti-v203-,rogue rogue-imx274-2cam mimic-image))
32.1-cti-v124-image: $(addsuffix -image,$(addprefix 32.1-cti-v124-,\
											astro-mpcie astro-mpcie-tx2i astro-usb3 astro-usb3-tx2i astro-revG+ astro-revG+-tx2i \
											elroy-mpcie elroy-mpcie-tx2i elroy-usb3 elroy-usb3-tx2i elroy-revF+ elroy-refF+-tx2i \
											orbitty orbitty-tx2i \
											rosie rosie-tx2i \
											rudi-mpcie rudi-mpcie-tx2i rudi-usb3 rudi-usb3-tx2i rudi rudi-tx2i \
											sprocket \
											spacely-image spacely-image-tx2i spacely-imx274-6cam spacely-imx274-6cam-tx2i spacely-imx274-3cam spacely-imx274-3cam-tx2i \
											cogswell cogswell-tx2i \
											vpg003-image vpg003-image-tx2i \
						))

32.1-cti-v125-image: $(addsuffix -image,$(addprefix 32.1-cti-v125-,\
											astro-mpcie astro-mpcie-tx2i astro-usb3 astro-usb3-tx2i astro-revG+ astro-revG+-tx2i \
											elroy-mpcie elroy-mpcie-tx2i elroy-usb3 elroy-usb3-tx2i elroy-revF+ elroy-refF+-tx2i \
											orbitty orbitty-tx2i \
											rosie rosie-tx2i \
											rudi-mpcie rudi-mpcie-tx2i rudi-usb3 rudi-usb3-tx2i rudi rudi-tx2i \
											sprocket \
											spacely-image spacely-image-tx2i spacely-imx274-6cam spacely-imx274-6cam-tx2i spacely-imx274-3cam spacely-imx274-3cam-tx2i \
											cogswell cogswell-tx2i \
											vpg003-image vpg003-image-tx2i \
						))

32.1-cti-v203-%:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$* $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-jax.conf $(CURDIR)/cti/32.1/bsp/v203.conf $(REPO):$@)

32.1-cti-v124-%:
	# $(subst +,plus,$(REPO):$@) replaces '+' with 'plus' in the docker tag
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$* $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-tx2.conf $(CURDIR)/cti/32.1/bsp/v124.conf $(subst +,plus,$(REPO):$@))

32.1-cti-v125-%:
	# $(subst +,plus,$(REPO):$@) replaces '+' with 'plus' in the docker tag
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$* $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-tx2.conf $(CURDIR)/cti/32.1/bsp/v125.conf $(subst +,plus,$(REPO):$@))


# These have to be constantly updated or cached off.
# Get the ubuntu-18.04-server-cloudimg-arm64-root.tar.xz from https://cloud-images.ubuntu.com/bionic/
#bionic-server-20190402 : $(addprefix bionic-server-20190402-,32.2 32.1)

#bionic-server-20190402-32.1: $(addprefix bionic-server-cloudimg-20190402-32.1-,jax tx2 nano-dev)

#bionic-server-20190402-32.2: $(addprefix bionic-server-cloudimg-20190402-32.2-,jax tx2 tx2i tx2-4gb tx1 nano-dev nano)

#bionic-server-cloudimg-20190402-%:	
#	$(CURDIR)/build.sh $(CURDIR)/rootfs/bionic-server-cloudimg-20190402.conf $(CURDIR)/drivers/$*.conf $(REPO):$@
