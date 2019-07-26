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

jetpack-bases: jetpack-4.2.1-bases jetpack-4.2-bases

jetpack-4.2-bases: l4t-32.1-nano-dev-jetpack-4.2-base l4t-32.1-tx2-jetpack-4.2-base l4t-32.1-jax-jetpack-4.2-base

jetpack-4.2.1-bases: l4t-32.2-jax-jetpack-4.2.1-base l4t-32.2-tx2-jetpack-4.2.1-base l4t-32.2-tx2i-jetpack-4.2.1-base l4t-32.2-tx2-4gb-jetpack-4.2.1-base l4t-32.2-tx1-jetpack-4.2.1-base l4t-32.2-nano-dev-jetpack-4.2.1-base l4t-32.2-nano-jetpack-4.2.1-base 

l4t-32.1-jax-jetpack-4.2-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.1-nano-dev-jetpack-4.2-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.1-tx2-jetpack-4.2-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.2-jax-jetpack-4.2.1-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.2-tx2-jetpack-4.2.1-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.2-tx2i-jetpack-4.2.1-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.2-tx2-4gb-jetpack-4.2.1-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.2-tx1-jetpack-4.2.1-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.2-nano-jetpack-4.2.1-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

l4t-32.2-nano-dev-jetpack-4.2.1-base:
	$(CURDIR)/build.sh $(CURDIR)/jetpack-bases/$@ $(REPO):$@

bionic-server-20190402 : $(addprefix bionic-server-20190402-,32.2 32.1)

bionic-server-20190402-32.1: $(addprefix bionic-server-cloudimg-20190402-32.1-,jax tx2 nano-dev)

bionic-server-20190402-32.2: $(addprefix bionic-server-cloudimg-20190402-32.2-,jax tx2 tx2i tx2-4gb tx1 nano-dev nano)

bionic-server-cloudimg-20190402-%:	
	$(CURDIR)/build.sh $(CURDIR)/rootfs/bionic-server-cloudimg-20190402.conf $(CURDIR)/drivers/$*.conf $(REPO):$@


%-cti-%:
	make -C $(CURDIR)/cti $*

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

32.1-cti-v125: $(addprefix 32.1-cti-v125-,\
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
	(DOCKER_FILE_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$* $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-jax.conf $(CURDIR)/cti/32.1/bsp/v203.conf $(REPO):$@)

32.1-cti-v124-%:
	# $(subst +,plus,$(REPO):$@) replaces '+' with 'plus' in the docker tag
	(DOCKER_FILE_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$* $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-tx2.conf $(CURDIR)/cti/32.1/bsp/v124.conf $(subst +,plus,$(REPO):$@))

32.1-cti-v125-%:
	# $(subst +,plus,$(REPO):$@) replaces '+' with 'plus' in the docker tag
	(DOCKER_FILE_ROOT="$(CURDIR)/cti/32.1" TARGET_BOARD=$* $(CURDIR)/build.sh $(CURDIR)/cti/32.1/rootfs/tegra-linux-sample-32.1.0-tx2.conf $(CURDIR)/cti/32.1/bsp/v124.conf $(subst +,plus,$(REPO):$@))