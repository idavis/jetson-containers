#!make

include $(CURDIR)/.env
export $(shell sed 's/=.*//' .env)

# Allow override for moby or another runtime
export DOCKER ?= docker

export MKDIR ?= mkdir

export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)

# Used in driver pack base
export BIONIC_VERSION_ID ?= bionic-20190307
export XENIAL_VERSION_ID ?= xenial-20190222

# Allow additional options such as --squash
# DOCKER_BUILD_ARGS ?= ""
export DOCKER_CONTEXT ?= .

.PHONY: all

all: driver-packs jetpacks

driver-packs: $(addprefix driver-pack-,32.1 31.1 28.3 28.2.1 28.2 28.1)

driver-pack-32.1: $(addprefix l4t-32.1-,jax tx2 nano)

driver-pack-31.1: $(addprefix l4t-31.1-,jax)

driver-pack-28.3: $(addprefix l4t-28.3-,tx2 tx1)

driver-pack-28.2.1: $(addprefix l4t-28.2.1-,tx2)

driver-pack-28.2: $(addprefix l4t-28.2-,tx1)

driver-pack-28.1: $(addprefix l4t-28.1-,tx2 tx1)

l4t-%:
	make -C $(CURDIR)/docker/l4t $*

jetpack-deps: $(addprefix jetpack-,4.2-deps)

jetpack-4.2-deps: $(addsuffix -jetpack-4.2-deps,jax tx2 nano)

%-jetpack-4.2-deps:
	make -C $(CURDIR)/docker/jetpack $@

jetpacks: $(addprefix jetpack-,4.2 4.1.1 3.3 3.2.1)

jetpack-4.2: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-jetpack-4.2

jetpack-4.1.1: 31.1-jax-jetpack-4.1.1

jetpack-3.3: 28.3-tx2-jetpack-3.3 28.3-tx1-jetpack-3.3 28.2.1-tx2-jetpack-3.3 28.2-tx1-jetpack-3.3

jetpack-3.2.1: 28.3-tx2-jetpack-3.2.1 28.3-tx1-jetpack-3.2.1 28.2.1-tx2-jetpack-3.2.1 28.2-tx1-jetpack-3.2.1

%-jax-jetpack-4.2: l4t-%-jax-tx2
	make -C $(CURDIR)/docker/jetpack $@

%-tx2-jetpack-4.2: l4t-%-jax-tx2
	make -C $(CURDIR)/docker/jetpack $@

%-nano-jetpack-4.2: l4t-%-nano
	make -C $(CURDIR)/docker/jetpack $@

%-jetpack-4.1.1:l4t-%
	make -C $(CURDIR)/docker/jetpack $@

%-jetpack-3.3: l4t-%
	make -C $(CURDIR)/docker/jetpack $@

%-jetpack-3.2.1: l4t-%
	make -C $(CURDIR)/docker/jetpack $@


build-32.1-jax-jetpack-4.2-samples:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) --build-arg IMAGE_NAME=$(IMAGE_NAME) \
					-t $(REPO):32.1-jax-jetpack-4.2-samples \
					-f $(CURDIR)/docker/examples/samples/Dockerfile \
					$(DOCKER_CONTEXT)

run-32.1-jax-jetpack-4.2-samples: build-32.1-jax-jetpack-4.2-samples
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
				$(REPO):32.1-jax-jetpack-4.2-samples

image-%:
	make -C $(CURDIR)/flash $*

opencv-4.0.1-l4t-32.1-jetpack-4.2:
	make -C $(CURDIR)/docker/OpenCV $@

opencv-4.0.1-l4t-28.3-jetpack-3.3:
	make -C $(CURDIR)/docker/OpenCV $@

pytorch-1.1.0-l4t-32.1-jetpack-4.2:
	make -C $(CURDIR)/docker/pytorch $@

pytorch-1.1.0-l4t-28.3-jetpack-3.3:
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