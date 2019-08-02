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

cti-32.1-v203-image: $(addsuffix -image,$(addprefix cti-32.1-v203-,rogue rogue-imx274-2cam mimic-base))
cti-32.1-v124-image: $(addsuffix -image,$(addprefix cti-32.1-v124-,\
											astro-mpcie astro-mpcie-tx2i astro-usb3 astro-usb3-tx2i astro-revG+ astro-revG+-tx2i \
											elroy-mpcie elroy-mpcie-tx2i elroy-usb3 elroy-usb3-tx2i elroy-revF+ elroy-refF+-tx2i \
											orbitty orbitty-tx2i \
											rosie rosie-tx2i \
											rudi-mpcie rudi-mpcie-tx2i rudi-usb3 rudi-usb3-tx2i rudi rudi-tx2i \
											sprocket \
											spacely-base spacely-base-tx2i spacely-imx274-6cam spacely-imx274-6cam-tx2i spacely-imx274-3cam spacely-imx274-3cam-tx2i \
											cogswell cogswell-tx2i \
											vpg003-base vpg003-base-tx2i \
						))

cti-32.1-v125-image: $(addsuffix -image,$(addprefix cti-32.1-v125-,\
											astro-mpcie astro-mpcie-tx2i astro-usb3 astro-usb3-tx2i astro-revG+ astro-revG+-tx2i \
											elroy-mpcie elroy-mpcie-tx2i elroy-usb3 elroy-usb3-tx2i elroy-revF+ elroy-refF+-tx2i \
											orbitty orbitty-tx2i \
											rosie rosie-tx2i \
											rudi-mpcie rudi-mpcie-tx2i rudi-usb3 rudi-usb3-tx2i rudi rudi-tx2i \
											sprocket \
											spacely-base spacely-base-tx2i spacely-imx274-6cam spacely-imx274-6cam-tx2i spacely-imx274-3cam spacely-imx274-3cam-tx2i \
											cogswell cogswell-tx2i \
											vpg003-base vpg003-base-tx2i \
						))

cti-32.1-v203-%:
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$(subst -image,,$*) $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-jax.conf $(CURDIR)/cti/32.1/bsp/v203.conf $(REPO):$@)

cti-32.1-v124-%:
	# $(subst +,plus,$(REPO):$@) replaces '+' with 'plus' in the docker tag
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$(subst -image,,$*) $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-tx2.conf $(CURDIR)/cti/32.1/bsp/v124.conf $(subst +,plus,$(REPO):$@))

cti-32.1-v125-%:
	# $(subst +,plus,$(REPO):$@) replaces '+' with 'plus' in the docker tag
	(DOCKER_BUILD_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$(subst -image,,$*) $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-tx2.conf $(CURDIR)/cti/32.1/bsp/v125.conf $(subst +,plus,$(REPO):$@))
