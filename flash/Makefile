#!make

# Default squash as our base images need to be small unless overridden
export DOCKER_BUILD_ARGS ?= --squash

# Allow override for moby or another runtime
export DOCKER ?= docker

export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)

# Used for creating the flashing container.
export VERSION_ID ?= bionic-20190912.1

# Allow additional options such as --squash
# DOCKER_BUILD_ARGS ?= ""

.PHONY: all

include cti.mk

all: jetpack-image

jetpack-image: jetpack-4.2.1-image jetpack-4.2-image

jetpack-4.2-image: 32.1-nano-dev-jetpack-4.2-image 32.1-tx2-jetpack-4.2-image 32.1-jax-jetpack-4.2-image

jetpack-4.2.1-image: 32.2-jax-jetpack-4.2.1-image 32.2-tx2-jetpack-4.2.1-image 32.2-tx2i-jetpack-4.2.1-image 32.2-tx2-4gb-jetpack-4.2.1-image 32.2-tx1-jetpack-4.2.1-image 32.2-nano-dev-jetpack-4.2.1-image 32.2-nano-jetpack-4.2.1-image

jetpack-4.2.2-image: 32.2.1-jax-jetpack-4.2.2-image 32.2.1-jax-8gb-jetpack-4.2.2-image 32.2.1-tx2-jetpack-4.2.2-image 32.2.1-tx2i-jetpack-4.2.2-image 32.2.1-tx2-4gb-jetpack-4.2.2-image 32.2.1-tx1-jetpack-4.2.2-image 32.2.1-nano-dev-jetpack-4.2.2-image 32.2.1-nano-jetpack-4.2.2-image

32.1-%-jetpack-4.2-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/l4t/32.1" $(CURDIR)/build.sh ./conf/$@ $(REPO):$@)

32.2-%-jetpack-4.2.1-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/l4t/32.2" $(CURDIR)/build.sh ./conf/$@ $(REPO):$@)

32.2.1-%-jetpack-4.2.2-image:
	(DOCKER_BUILD_ROOT="$(CURDIR)/l4t/32.2.1" $(CURDIR)/build.sh ./conf/$@ $(REPO):$@)

