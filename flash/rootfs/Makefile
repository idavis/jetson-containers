#!make

# Allow override for moby or another runtime
export DOCKER ?= docker

export REPO ?= l4t
export IMAGE_NAME ?= $(REPO)

# Used for creating the flashing container.
export VERSION_ID ?= bionic

#!make

all-rootfs: $(addsuffix -rootfs,bionic-base-20190426 bionic-server-cloudimg-20190722.1)

bionic-server-cloudimg-20190722.1-rootfs:
	$(CURDIR)/build-rootfs.sh $(CURDIR)/$(subst -rootfs,,$@).conf $(REPO):$@

bionic-base-20190426-rootfs:
	$(CURDIR)/build-rootfs.sh $(CURDIR)/$(subst -rootfs,,$@).conf $(REPO):$@

%-from-file-rootfs:
	ROOT_FS_ARCHIVE=$(ROOT_FS_ARCHIVE) $(CURDIR)/build-rootfs-from-file.sh $(REPO):$*-rootfs
