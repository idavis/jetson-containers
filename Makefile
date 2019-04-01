#!make

include .env
export $(shell sed 's/=.*//' .env)

export DOCKER ?= docker
export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)
# Used in driver pack base
export VERSION_ID ?= bionic-20190307


.PHONY: all

all: driver-pack-32.1 jetpack-4.2

driver-pack-32.1: $(addprefix l4t-32.1-,jax tx2 nano)

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
	$(DOCKER) build --build-arg IMAGE_NAME=$(IMAGE_NAME) \
                    -t $(REPO):$@ -f $(CURDIR)/docker/examples/samples/Dockerfile .

run-32.1-jax-jetpack-4.2-samples: 32.1-jax-jetpack-4.2-samples
	$(DOCKER) run --rm -it \
						--device=/dev/nvhost-ctrl \
						--device=/dev/nvhost-ctrl-gpu \
						--device=/dev/nvmap \
						--device=/dev/nvhost-gpu \
						--device=/dev/nvhost-vic \
						l4t:32.1-jax-jetpack-4.2-samples
