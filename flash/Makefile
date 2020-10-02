#!make

# Default squash as our base images need to be small unless overridden
export DOCKER_BUILD_ARGS ?= --squash

# Allow override for moby or another runtime
export DOCKER ?= docker

export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)

# Used for creating the flashing container.
export VERSION_ID ?= bionic

# Allow additional options such as --squash
# DOCKER_BUILD_ARGS ?= ""

.PHONY: all

include cti.mk
include jetpack.mk

