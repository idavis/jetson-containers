#!make

ifneq ("$(wildcard $(CURDIR)/.env)","")
	include $(CURDIR)/.env
	export $(shell sed 's/=.*//' .env)
endif

# Allow override for moby or another runtime
export DOCKER ?= docker

export MKDIR ?= mkdir

export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)

# Used in driver pack base
export BIONIC_VERSION_ID ?= bionic-20190612
export XENIAL_VERSION_ID ?= xenial-20190610

# Allow additional options such as --squash
# DOCKER_BUILD_ARGS ?= ""

export SDKM_DOWNLOADS ?= invalid

export DOCKERFILE_PREFIX ?= default

.PHONY: all

all: jetpack-deps driver-packs jetpacks

driver-packs: $(addprefix driver-pack-,32.2 32.1)

driver-pack-32.2: $(addprefix l4t-32.2-,jax tx2 tx2i tx2-4gb tx1 nano nano-dev)

driver-pack-32.1: $(addprefix l4t-32.1-,jax tx2 nano-dev)

l4t-%:
	make -C $(CURDIR)/docker/l4t $*

cti-%:
	make -C $(CURDIR)/docker/cti $@

image-%:
	make -C $(CURDIR)/flash $*-image

rootfs-%:
	make -C $(CURDIR)/flash/rootfs $*-rootfs

from-file-rootfs-%:
	make -C $(CURDIR)/flash/rootfs $*-from-file-rootfs

# Dependencies

deps-%:
	make -C $(CURDIR)/docker/jetpack $*-deps

from-deps-folder-%:
	make -C $(CURDIR)/docker/jetpack $*-from-deps-folder

# JetPack

jetpacks: $(addprefix jetpack-,4.2.1 4.2)

jetpack-4.2.1: 32.2-jax-jetpack-4.2.1 32.2-tx2-jetpack-4.2.1 32.2-tx2i-jetpack-4.2.1 32.2-tx2-4gb-jetpack-4.2.1 32.2-tx1-jetpack-4.2.1 32.2-nano-jetpack-4.2.1 32.2-nano-dev-jetpack-4.2.1

jetpack-4.2: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-dev-jetpack-4.2

# JetPack 4.2.1

32.2-%:
	make -C $(CURDIR)/docker/jetpack $@

# JetPack 4.2

32.1-%:
	make -C $(CURDIR)/docker/jetpack $@

# Samples

build-%-samples:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg TAG=$* \
					-t $(REPO):$*-samples \
					-f $(CURDIR)/docker/examples/samples/Dockerfile \
					.

run-%-samples:
	$(DOCKER) run $(DOCKER_RUN_ARGS) \
				--rm \
				-it \
				--device=/dev/nvhost-ctrl \
				--device=/dev/nvhost-ctrl-gpu \
				--device=/dev/nvhost-prof-gpu \
				--device=/dev/nvmap \
				--device=/dev/nvhost-gpu \
				--device=/dev/nvhost-as-gpu \
				--device=/dev/nvhost-vic \
				$(REPO):$*-samples

build-%-tf_to_trt_image_classification:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg TAG=$* \
					-t $(REPO):$*-tf_to_trt_image_classification \
					-f $(CURDIR)/docker/tf_to_trt_image_classification/samples/Dockerfile \
					.

run-%-tf_to_trt_image_classification:
	$(DOCKER) run $(DOCKER_RUN_ARGS) \
				--rm \
				-it \
				--device=/dev/nvhost-ctrl \
				--device=/dev/nvhost-ctrl-gpu \
				--device=/dev/nvhost-prof-gpu \
				--device=/dev/nvmap \
				--device=/dev/nvhost-gpu \
				--device=/dev/nvhost-as-gpu \
				--device=/dev/nvhost-vic \
				--device=/dev/tegra_dc_ctrl \
				$(REPO):$*-tf_to_trt_image_classification


build-%-deepstream-4.0-devel:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg TAG=$* \
					-t $(REPO):$*-deepstream-4.0 \
					-f $(CURDIR)/docker/examples/deepstream/Dockerfile \
					.

build-%-deepstream-4.0-release:
	$(DOCKER) build --squash \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg TAG=$* \
					--build-arg DEPENDENCIES_IMAGE=$(IMAGE_NAME):$*-deps \
					-t $(REPO):$*-deepstream-4.0-release \
					-f $(CURDIR)/docker/examples/deepstream/$*.Dockerfile \
					.

build-%-tensorflow-zoo-devel:
	$(DOCKER) build --squash \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg TAG=$* \
					-t $(REPO):$*-tensorflow-zoo-devel \
					-f $(CURDIR)/docker/examples/tensorflow/zoo/Dockerfile \
					$(CURDIR)/docker/examples/tensorflow/zoo/

build-%-tensorflow-zoo-min-full:
	$(DOCKER) build --squash \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg TAG=$* \
					--build-arg DEPENDENCIES_IMAGE=$(IMAGE_NAME):$*-deps \
					-t $(REPO):$*-tensorflow-zoo-min-full \
					-f $(CURDIR)/docker/examples/tensorflow/zoo/$*-min-full.Dockerfile \
					$(CURDIR)/docker/examples/tensorflow/zoo/

build-%-tensorflow-zoo-min:
	$(DOCKER) build --squash \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg TAG=$* \
					--build-arg DEPENDENCIES_IMAGE=$(IMAGE_NAME):$*-deps \
					-t $(REPO):$*-tensorflow-zoo-min \
					-f $(CURDIR)/docker/examples/tensorflow/zoo/$*-min.Dockerfile \
					$(CURDIR)/docker/examples/tensorflow/zoo/

# Libraries

opencv-4.0.1-%:
	make -C $(CURDIR)/docker/OpenCV $@

pytorch-1.1.0-%:
	make -C $(CURDIR)/docker/pytorch $@
