#!make

include .env
export $(shell sed 's/=.*//' .env)

# Allow override for moby or another runtime
export DOCKER ?= docker

export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)

# Used in driver pack base
export VERSION_ID ?= bionic-20190307

# Allow additional options such as --squash
# DOCKER_ARGS ?= ""
export DOCKER_CONTEXT ?= .

.PHONY: all

all: $(addprefix driver-pack-,32.1 31.1 28.3 28.2.1 28.2 28.1) jetpack

driver-pack-32.1: $(addprefix l4t-32.1-,jax tx2 nano)

driver-pack-31.1: $(addprefix l4t-31.1-,jax)

driver-pack-28.3: $(addprefix l4t-28.3-,tx2 tx1)

driver-pack-28.2.1: $(addprefix l4t-28.2.1-,tx2)

driver-pack-28.2: $(addprefix l4t-28.2-,tx1)

driver-pack-28.1: $(addprefix l4t-28.1-,tx2 tx1)

jetpack: $(addprefix jetpack-,4.2)

jetpack-4.2: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-jetpack-4.2

l4t-%:
	make -C $(CURDIR)/docker/l4t $*

%-jax-jetpack-4.2: l4t-%-jax-tx2
	make -C $(CURDIR)/docker/jetpack $@

%-tx2-jetpack-4.2: l4t-%-jax-tx2
	make -C $(CURDIR)/docker/jetpack $@

%-nano-jetpack-4.2: l4t-%-nano
	make -C $(CURDIR)/docker/jetpack $@

32.1-jax-jetpack-4.2-samples:
	$(DOCKER) build $(DOCKER_ARGS) --build-arg IMAGE_NAME=$(IMAGE_NAME) \
					-t $(REPO):$@ \
					-f $(CURDIR)/docker/examples/samples/Dockerfile \
					$(DOCKER_CONTEXT)

run-32.1-jax-jetpack-4.2-samples: 32.1-jax-jetpack-4.2-samples
	$(DOCKER) run \
				--rm \
				-it \
				--device=/dev/nvhost-ctrl \
				--device=/dev/nvhost-ctrl-gpu \
				--device=/dev/nvmap \
				--device=/dev/nvhost-gpu \
				--device=/dev/nvhost-vic \
				l4t:32.1-jax-jetpack-4.2-samples

flash-%:
	make -C $(CURDIR)/flash $*
