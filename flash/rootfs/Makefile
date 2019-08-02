#!make

# Allow override for moby or another runtime
export DOCKER ?= docker

export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)

# Used for creating the flashing container.
export VERSION_ID ?= bionic-20190307

#!make

bases: $(addsuffix -rootfs,bionic-base-20190426 bionic-server-cloudimg-20190722.1)

%-rootfs:
	$(CURDIR)/build-rootfs.sh $(CURDIR)/$*.conf $(REPO):$@
