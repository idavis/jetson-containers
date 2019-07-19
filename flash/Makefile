#!make

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

all: bionic-server-20190402 jetpack-bases

jetpack-bases: l4t-28.2-tx1-jetpack-3.2.1-base l4t-31.1-jax-jetpack-4.1.1-base l4t-28.2-tx1-jetpack-3.3-base l4t-32.1-nano-dev-jetpack-4.2-base l4t-28.2.1-tx2-jetpack-3.2.1-base l4t-28.3-tx1-jetpack-3.3-base l4t-32.1-tx2-jetpack-4.2-base l4t-28.2.1-tx2-jetpack-3.3-base l4t-28.3-tx2-jetpack-3.3-base l4t-32.1-jax-jetpack-4.2-base

l4t-28.2-tx1-jetpack-3.2.1-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-28.2-tx1-jetpack-3.2.1-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-31.1-jax-jetpack-4.1.1-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-28.2-tx1-jetpack-3.3-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.1-nano-dev-jetpack-4.2-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-28.2.1-tx2-jetpack-3.2.1-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-28.3-tx1-jetpack-3.3-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.1-tx2-jetpack-4.2-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-28.2.1-tx2-jetpack-3.3-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-28.3-tx2-jetpack-3.3-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.1-jax-jetpack-4.2-base:
	$(CURDIR)/build_from_make.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

bionic-server-20190402 : $(addprefix bionic-server-20190402-,32.1 31.1 28.3)

bionic-server-20190402-32.1: $(addprefix bionic-server-cloudimg-20190402-32.1-,jax tx2 nano-dev)

bionic-server-20190402-31.1: $(addprefix bionic-server-cloudimg-20190402-31.1-,jax)

bionic-server-20190402-28.3: $(addprefix bionic-server-cloudimg-20190402-28.3-,tx2 tx1)

bionic-server-cloudimg-20190402-%:	
	$(CURDIR)/build_from_make.sh $(CURDIR)/rootfs/bionic-server-cloudimg-20190402.conf $(CURDIR)/drivers/$*.conf $(REPO):$@


32.1-cti-v203: $(addprefix 32.1-cti-v203-,rogue rogue-imx274-2cam mimic-base)
32.1-cti-v124: $(addprefix 32.1-cti-v124-,\
											astro-mpcie astro-mpcie-tx2i astro-usb3 astro-usb3-tx2i astro-revG+ astro-revG+-tx2i \
											elroy-mpcie elroy-mpcie-tx2i elroy-usb3 elroy-usb3-tx2i elroy-revF+ elroy-refF+-tx2i \
											orbitty orbitty-tx2i \
											rosie rosie-tx2i \
											rudi-mpcie rudi-mpcie-tx2i rudi-usb3 rudi-usb3-tx2i rudi rudi-tx2i \
											sprocket \
											spacely-base spacely-base-tx2i spacely-imx274-6cam spacely-imx274-6cam-tx2i spacely-imx274-3cam spacely-imx274-3cam-tx2i \
											cogswell cogswell-tx2i \
											vpg003-base vpg003-base-tx2i \
				)

32.1-cti-v203-%:
	(TARGET_BOARD=$* $(CURDIR)/build_from_make.sh $(CURDIR)/rootfs/tegra-linux-sample-32.1.0-jax.conf $(CURDIR)/drivers/$(subst -$*,,$@).conf $(REPO):$@)

32.1-cti-v124-%:
	(TARGET_BOARD=$* $(CURDIR)/build_from_make.sh $(CURDIR)/rootfs/tegra-linux-sample-32.1.0-jax.conf $(CURDIR)/drivers/$(subst -$*,,$@).conf $(subst +,plus,$(REPO):$@))
