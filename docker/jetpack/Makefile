#!make

# Default squash as our base images need to be small unless overridden
DOCKER_BUILD_ARGS ?= --squash

NV_LOGIN_TYPE ?= devzone

.PHONY: all

all: 32.2-jetpack-4.2.1 32.1-jetpack-4.2 31.1-jax-jetpack-4.1.1

32.2-jetpack-4.2.1: 32.2-jax-jetpack-4.2.1 32.2-tx2-jetpack-4.2.1 32.2-tx2i-jetpack-4.2.1 32.2-tx2-4gb-jetpack-4.2.1 32.2-tx1-jetpack-4.2.1 32.2-nano-jetpack-4.2.1 32.2-nano-dev-jetpack-4.2.1

32.2-jax-jetpack-4.2.1: $(addprefix 32.2-jax-jetpack-4.2.1-,base devel runtime)

32.2-tx2-jetpack-4.2.1: $(addprefix 32.2-tx2-jetpack-4.2.1-,base devel runtime)

32.2-tx2i-jetpack-4.2.1: $(addprefix 32.2-tx2i-jetpack-4.2.1-,base devel runtime)

32.2-tx2-4gb-jetpack-4.2.1: $(addprefix 32.2-tx2-4gb-jetpack-4.2.1-,base devel runtime)

32.2-tx1-jetpack-4.2.1: $(addprefix 32.2-tx1-jetpack-4.2.1-,base devel runtime)

32.2-nano-jetpack-4.2.1: $(addprefix 32.2-nano-jetpack-4.2.1-,base devel runtime)

32.2-nano-dev-jetpack-4.2.1: $(addprefix 32.2-nano-dev-jetpack-4.2.1-,base devel runtime)

32.1-jetpack-4.2: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-dev-jetpack-4.2

32.1-jax-jetpack-4.2: $(addprefix 32.1-jax-jetpack-4.2-,base devel runtime)

jetpack-4.2.1-deps: $(addsuffix -jetpack-4.2.1-deps,jax tx2 tx2i tx2-4gb tx1 nano nano-dev host)

jetpack-4.2-deps: $(addsuffix -jetpack-4.2-deps,jax nano-dev tx2 host)

%-from-folder:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$* \
					-f $(CURDIR)/dependencies.Dockerfile \
					$(SDKM_DOWNLOADS)

jax-jetpack-4.2.1-deps:
	DEVICE_ID=P2888 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P2888

tx2-jetpack-4.2.1-deps:
	DEVICE_ID=P3310 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3310

tx2i-jetpack-4.2.1-deps:
	DEVICE_ID=P3489-0000 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3489-0000

tx2-4gb-jetpack-4.2.1-deps:
	DEVICE_ID=P3489-0080 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3489-0080

tx1-jetpack-4.2.1-deps:
	DEVICE_ID=P2180 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P2180

nano-jetpack-4.2.1-deps:
	DEVICE_ID=P3448-0020 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3448-0020

nano-dev-jetpack-4.2.1-deps:
	DEVICE_ID=P3448-0000 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3448-0000

host-jetpack-4.2.1-deps:
	DEVICE_ID=host DEVICE_OPTION=--host NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/host

jax-jetpack-4.2-deps:
	DEVICE_ID=P2888 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION=4.2 TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P2888

nano-dev-jetpack-4.2-deps:
	DEVICE_ID=P3448-0000 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION=4.2 TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P3448-0000

tx2-jetpack-4.2-deps:
	DEVICE_ID=P3310 DEVICE_OPTION=--target NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION=4.2 TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P3310

host-jetpack-4.2-deps:
	DEVICE_ID=host DEVICE_OPTION=--host NV_USER=$(NV_USER) NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION=4.2 TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

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

32.2-tx2-jetpack-4.2.1-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx2-jetpack-4.2.1-runtime: 32.2-tx2-jetpack-4.2.1-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx2-jetpack-4.2.1-devel: 32.2-tx2-jetpack-4.2.1-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx2i-jetpack-4.2.1-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2i-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2i/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx2i-jetpack-4.2.1-runtime: 32.2-tx2i-jetpack-4.2.1-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2i-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2i/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx2i-jetpack-4.2.1-devel: 32.2-tx2i-jetpack-4.2.1-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2i-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2i/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx2-4gb-jetpack-4.2.1-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-4gb-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2-4gb/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx2-4gb-jetpack-4.2.1-runtime: 32.2-tx2-4gb-jetpack-4.2.1-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-4gb-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2-4gb/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx2-4gb-jetpack-4.2.1-devel: 32.2-tx2-4gb-jetpack-4.2.1-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx2-4gb-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx2-4gb/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx1-jetpack-4.2.1-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx1-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx1/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx1-jetpack-4.2.1-runtime: 32.2-tx1-jetpack-4.2.1-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx1-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx1/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-tx1-jetpack-4.2.1-devel: 32.2-tx1-jetpack-4.2.1-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):tx1-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/tx1/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-nano-jetpack-4.2.1-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/nano/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-nano-jetpack-4.2.1-runtime: 32.2-nano-jetpack-4.2.1-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/nano/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-nano-jetpack-4.2.1-devel: 32.2-nano-jetpack-4.2.1-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/nano/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-nano-dev-jetpack-4.2.1-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-dev-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/nano-dev/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-nano-dev-jetpack-4.2.1-runtime: 32.2-nano-dev-jetpack-4.2.1-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-dev-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/nano-dev/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.2-nano-dev-jetpack-4.2.1-devel: 32.2-nano-dev-jetpack-4.2.1-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-dev-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					-f 4.2.1/nano-dev/devel/Dockerfile \
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

32.1-nano-dev-jetpack-4.2: $(addprefix 32.1-nano-dev-jetpack-4.2-,base devel runtime)

32.1-nano-dev-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-dev-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/nano-dev/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-dev-jetpack-4.2-runtime: 32.1-nano-dev-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-dev-jetpack-4.2-deps \
					-t $(REPO):$@ \
					-f 4.2/nano-dev/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-dev-jetpack-4.2-devel: 32.1-nano-dev-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):nano-dev-jetpack-4.2-deps \
					-t $(REPO):$@ -f 4.2/nano-dev/devel/Dockerfile \
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

