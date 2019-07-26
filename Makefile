#!make

include $(CURDIR)/.env
export $(shell sed 's/=.*//' .env)

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
export DOCKER_CONTEXT ?= .

export SDKM_DOWNLOADS ?= invalid

.PHONY: all

all: driver-packs jetpacks

driver-packs: $(addprefix driver-pack-,32.2 32.1)

driver-pack-32.2: $(addprefix l4t-32.2-,jax tx2 tx2i tx2-4gb tx1 nano nano-dev)

driver-pack-32.1: $(addprefix l4t-32.1-,jax tx2 nano-dev)

l4t-%:
	make -C $(CURDIR)/docker/l4t $*

cti-%:
	make -C $(CURDIR)/docker/cti $@

jetpack-deps: $(addprefix jetpack-,4.2.1-deps 4.2-deps)

jetpack-4.2.1-deps: $(addsuffix -jetpack-4.2.1-deps,jax tx2 tx2i tx2-4gb tx1 nano nano-dev)

jetpack-4.2-deps: $(addsuffix -jetpack-4.2-deps,jax tx2 nano-dev)

%-jetpack-4.2-deps:
	make -C $(CURDIR)/docker/jetpack $@

%-jetpack-4.2-deps-from-folder:
	make -C $(CURDIR)/docker/jetpack $@

%-jetpack-4.2.1-deps:
	make -C $(CURDIR)/docker/jetpack $@

%-jetpack-4.2.1-deps-from-folder:
	make -C $(CURDIR)/docker/jetpack $@

jetpacks: $(addprefix jetpack-,4.2.1 4.2)

jetpack-4.2.1: 32.2-jax-jetpack-4.2.1 32.2-tx2-jetpack-4.2.1 32.2-tx2i-jetpack-4.2.1 32.2-tx2-4gb-jetpack-4.2.1 32.2-tx1-jetpack-4.2.1 32.2-nano-jetpack-4.2.1 32.2-nano-dev-jetpack-4.2.1

jetpack-4.2: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-dev-jetpack-4.2

%-jax-jetpack-4.2.1: l4t-%-jax
	make -C $(CURDIR)/docker/jetpack $@

%-tx2-jetpack-4.2.1: l4t-%-tx2
	make -C $(CURDIR)/docker/jetpack $@

%-tx2i-jetpack-4.2.1: l4t-%-tx2i
	make -C $(CURDIR)/docker/jetpack $@

%-tx2-4gb-jetpack-4.2.1: l4t-%-tx2-4gb
	make -C $(CURDIR)/docker/jetpack $@

%-tx1-jetpack-4.2.1: l4t-%-tx1
	make -C $(CURDIR)/docker/jetpack $@

%-nano-jetpack-4.2.1: l4t-%-nano
	make -C $(CURDIR)/docker/jetpack $@

%-nano-dev-jetpack-4.2.1: l4t-%-nano-dev
	make -C $(CURDIR)/docker/jetpack $@

%-jax-jetpack-4.2: l4t-%-jax-tx2
	make -C $(CURDIR)/docker/jetpack $@

%-tx2-jetpack-4.2: l4t-%-jax-tx2
	make -C $(CURDIR)/docker/jetpack $@

%-nano-dev-jetpack-4.2: l4t-%-nano-dev
	make -C $(CURDIR)/docker/jetpack $@

build-%-samples:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg TAG=$* \
					-t $(REPO):$*-samples \
					-f $(CURDIR)/docker/examples/samples/Dockerfile \
					$(DOCKER_CONTEXT)

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

image-%:
	make -C $(CURDIR)/flash $*

opencv-4.0.1-l4t-32.1-jetpack-4.2:
	make -C $(CURDIR)/docker/OpenCV $@

pytorch-1.1.0-l4t-32.1-jetpack-4.2:
	make -C $(CURDIR)/docker/pytorch $@

build-32.1-jax-jetpack-4.2-tf_to_trt_image_classification:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) --build-arg IMAGE_NAME=$(IMAGE_NAME) \
					-t $(REPO):32.1-jax-jetpack-4.2-tf_to_trt_image_classification \
					-f $(CURDIR)/docker/examples/tf_to_trt_image_classification/Dockerfile \
					$(DOCKER_CONTEXT)

run-32.1-jax-jetpack-4.2-tf_to_trt_image_classification: build-32.1-jax-jetpack-4.2-tf_to_trt_image_classification
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
				$(REPO):32.1-jax-jetpack-4.2-tf_to_trt_image_classification