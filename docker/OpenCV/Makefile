#!make

DIST_DIR := $(CURDIR)/../../dist

OPENCV_GIT_VERSION ?= 4.0.1
DOCKERFILE ?= INVALID
CUDA_ARCH_BIN := INVALID
IMAGE ?= INVALID

# CUDA_ARCH
# jax: 7.2
# tx2: 6.2
# tx1: 5.3
# tk1: 3.2
# nano: 5.3

.PHONY: all

all: opencv-4.0.1-l4t-32.1-jetpack-4.2

opencv-4.0.1-l4t-32.1-jetpack-4.2: DOCKERFILE := bionic.Dockerfile
opencv-4.0.1-l4t-32.1-jetpack-4.2: CUDA_ARCH_BIN := 5.3;6.2;7.2
opencv-4.0.1-l4t-32.1-jetpack-4.2: IMAGE := 32.1-jax-jetpack-4.2-devel
opencv-4.0.1-l4t-32.1-jetpack-4.2: build-opencv-4.0.1-l4t-32.1-jetpack-4.2

build-%:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE=$(REPO):$(IMAGE) \
					--build-arg OPENCV_GIT_VERSION=$(OPENCV_GIT_VERSION) \
					--build-arg CUDA_ARCH_BIN="$(CUDA_ARCH_BIN)" \
					-t $(REPO):$* \
					-f $(CURDIR)/$(DOCKERFILE) \
					$(DOCKER_CONTEXT)

	$(MKDIR) -p $(DIST_DIR)/$*
	rm -f $*.cid
	$(DOCKER) run --cidfile $*.cid $(REPO):$*
	$(DOCKER) cp $$(cat $*.cid):/opencv/build/OpenCV-$(OPENCV_GIT_VERSION)-aarch64.sh $(DIST_DIR)/$*/
	$(DOCKER) rm $$(cat $*.cid) && rm $*.cid
	$(DOCKER) image rm $(REPO):$*

