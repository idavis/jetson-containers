#!make

DIST_DIR := $(CURDIR)/../../dist

PYTORCH_GIT_VERSION ?= v1.1.0
TORCH_CUDA_ARCH_LIST := 5.3;6.2;7.2
IMAGE ?= INVALID

# CUDA_ARCH
# jax: 7.2
# tx2: 6.2
# tx1: 5.3
# tk1: 3.2
# nano: 5.3

.PHONY: all

all: pytorch-1.1.0-32.1-jetpack-4.2 pytorch-1.1.0-32.2-jax-jetpack-4.2.1

pytorch-1.1.0-32.1-jax-jetpack-4.2: TORCH_CUDA_ARCH_LIST := 5.3;6.2;7.2
pytorch-1.1.0-32.1-jax-jetpack-4.2: IMAGE := 32.1-jax-jetpack-4.2-devel
pytorch-1.1.0-32.1-jax-jetpack-4.2: build-pytorch-1.1.0-32.1-jax-jetpack-4.2

pytorch-1.1.0-32.2-jax-jetpack-4.2.1: TORCH_CUDA_ARCH_LIST := 5.3;6.2;7.2
pytorch-1.1.0-32.2-jax-jetpack-4.2.1: IMAGE := 32.2-jax-jetpack-4.2.1-devel
pytorch-1.1.0-32.2-jax-jetpack-4.2.1: build-pytorch-1.1.0-32.2-jax-jetpack-4.2.1

build-%:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE=$(REPO):$(IMAGE) \
					--build-arg PYTORCH_GIT_VERSION=$(PYTORCH_GIT_VERSION) \
					--build-arg TORCH_CUDA_ARCH_LIST="$(TORCH_CUDA_ARCH_LIST)" \
					-t $(REPO):$* \
					-f $(CURDIR)/Dockerfile \
					.

	$(MKDIR) -p $(DIST_DIR)/$*
	rm -f $*.cid
	$(DOCKER) run --cidfile $*.cid $(REPO):$*
	$(DOCKER) cp $$(cat $*.cid):/pytorch/dist/torch-1.1.0a0+b90cbb8-cp36-cp36m-linux_aarch64.whl $(DIST_DIR)/$*/
	$(DOCKER) rm $$(cat $*.cid) && rm $*.cid
	$(DOCKER) image rm $(REPO):$*

