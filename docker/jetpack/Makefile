#!make

# Default squash as our base images need to be small unless overridden
DOCKER_BUILD_ARGS ?= --squash

.PHONY: all

all: 32.2-jetpack-4.2.1 32.1-jetpack-4.2 31.1-jax-jetpack-4.1.1

32.2-jetpack-4.2.1: 32.2-jax-jetpack-4.2.1
# 32.1-tx2-jetpack-4.2 32.1-nano-jetpack-4.2

32.2-jax-jetpack-4.2.1: $(addprefix 32.2-jax-jetpack-4.2.1-,base devel runtime)

32.1-jetpack-4.2: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-jetpack-4.2

32.1-jax-jetpack-4.2: $(addprefix 32.1-jax-jetpack-4.2-,base devel runtime)

jetpack-4.2.1-deps: $(addsuffix -jetpack-4.2.1-deps,jax host)

jetpack-4.2-deps: $(addsuffix -jetpack-4.2-deps,jax nano tx2 host)

%-from-folder:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$* \
					-f $(CURDIR)/dependencies.Dockerfile \
					$(SDKM_DOWNLOADS)

jax-jetpack-4.2.1-deps:
	DEVICE_ID=P2888 DEVCIE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=devzone PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P2888

host-jetpack-4.2.1-deps:
	DEVICE_ID=host DEVCIE_OPTION=--host NV_USER=$(NV_USER) NV_LOGIN_TYPE=devzone PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/host

jax-jetpack-4.2-deps:
	DEVICE_ID=P2888 DEVCIE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=devzone PRODUCT=Jetson JETPACK_VERSION=4.2 TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P2888

nano-jetpack-4.2-deps:
	DEVICE_ID=P3448-0000 DEVCIE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=devzone PRODUCT=Jetson JETPACK_VERSION=4.2 TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P3448-0000

tx2-jetpack-4.2-deps:
	DEVICE_ID=P3310 DEVCIE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=devzone PRODUCT=Jetson JETPACK_VERSION=4.2 TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P3310

host-jetpack-4.2-deps:
	DEVICE_ID=host DEVCIE_OPTION=--host NV_USER=$(NV_USER) NV_LOGIN_TYPE=devzone PRODUCT=Jetson JETPACK_VERSION=4.2 TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/host


32.2-jax-jetpack-4.2.1-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):jax-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/jax/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-jax-jetpack-4.2.1-runtime: 32.2-jax-jetpack-4.2.1-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):jax-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/jax/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-jax-jetpack-4.2.1-devel: 32.2-jax-jetpack-4.2.1-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):jax-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/jax/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-jax-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):jax-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/jax/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-jax-jetpack-4.2-runtime: 32.1-jax-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):jax-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/jax/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-jax-jetpack-4.2-devel: 32.1-jax-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):jax-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/jax/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2: $(addprefix 32.1-nano-jetpack-4.2-,base devel runtime)

32.1-nano-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/nano/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2-runtime: 32.1-nano-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/nano/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2-devel: 32.1-nano-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-jetpack-4.2-deps \
					-t $(REPO):$@ -f 4.2/nano/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2: $(addprefix 32.1-tx2-jetpack-4.2-,base devel runtime)

32.1-tx2-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/tx2/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2-runtime: 32.1-tx2-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/tx2/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2-devel: 32.1-tx2-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/tx2/devel/Dockerfile \
					$(DOCKER_CONTEXT)

31.1-jax-jetpack-4.1.1:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					-t $(REPO):$@ \
					-f 4.1.1/jax/Dockerfile \
					$(DOCKER_CONTEXT)

%-tx2-jetpack-3.3:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg L4T_VERSION=$* \
					-t $(REPO):$@ \
					-f 3.3/tx2/Dockerfile \
					$(DOCKER_CONTEXT)

%-tx1-jetpack-3.3:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg L4T_VERSION=$* \
					-t $(REPO):$@ \
					-f 3.3/tx1/Dockerfile \
					$(DOCKER_CONTEXT)

%-tx2-jetpack-3.2.1:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg L4T_VERSION=$* \
					-t $(REPO):$@ \
					-f 3.2.1/tx2/Dockerfile \
					$(DOCKER_CONTEXT)

%-tx1-jetpack-3.2.1:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg L4T_VERSION=$* \
					-t $(REPO):$@ \
					-f 3.2.1/tx1/Dockerfile \
					$(DOCKER_CONTEXT)

