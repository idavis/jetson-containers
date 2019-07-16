#!make

# Default squash as our base images need to be small unless overridden
DOCKER_BUILD_ARGS ?= --squash

.PHONY: all

all: 32.1-jetpack-4.2 31.1-jax-jetpack-4.1.1

32.1-jetpack-4.2: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-jetpack-4.2

32.1-jax-jetpack-4.2: $(addprefix 32.1-jax-jetpack-4.2-,base devel runtime)

jetpack-4.2-deps: $(addsuffix -jetpack-4.2-deps,jax nano tx2 host)

%-from-folder:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$* \
					-f $(CURDIR)/dependencies.Dockerfile \
					$(SDKM_DOWNLOADS)

jax-jetpack-4.2-deps: jetpack-sdkmanager
	$(DOCKER) run $(DOCKER_RUN_ARGS) \
				--rm \
				-it \
				-e "DOCKER=$(DOCKER)" \
				-e "DEVICE_ID=P2888" \
				-e "DEVCIE_OPTION=--target" \
				-e "NV_USER=$(NV_USER)" \
				-e "TAG=$(REPO):$@" \
				-e "NV_LOGIN_TYPE=devzone" \
				-e "PRODUCT=Jetson" \
				-e "JETPACK_VERSION=4.2" \
				-e "TARGET_OS=Linux" \
				-e "ACCEPT_SDK_LICENCE=accept" \
				-v //var//run//docker.sock://var//run//docker.sock \
				$(REPO):jetpack-sdkmanager

nano-jetpack-4.2-deps: jetpack-sdkmanager
	$(DOCKER) run $(DOCKER_RUN_ARGS) \
				--rm \
				-it \
				-e "DOCKER=$(DOCKER)" \
				-e "DEVICE_ID=P3448-0000" \
				-e "DEVCIE_OPTION=--target" \
				-e "NV_USER=$(NV_USER)" \
				-e "TAG=$(REPO):$@" \
				-e "NV_LOGIN_TYPE=devzone" \
				-e "PRODUCT=Jetson" \
				-e "JETPACK_VERSION=4.2" \
				-e "TARGET_OS=Linux" \
				-e "ACCEPT_SDK_LICENCE=accept" \
				-v //var//run//docker.sock://var//run//docker.sock \
				$(REPO):jetpack-sdkmanager

tx2-jetpack-4.2-deps: jetpack-sdkmanager
	$(DOCKER) run $(DOCKER_RUN_ARGS) \
				--rm \
				-it \
				-e "DOCKER=$(DOCKER)" \
				-e "DEVICE_ID=P3310" \
				-e "DEVCIE_OPTION=--target" \
				-e "NV_USER=$(NV_USER)" \
				-e "TAG=$(REPO):$@" \
				-e "NV_LOGIN_TYPE=devzone" \
				-e "PRODUCT=Jetson" \
				-e "JETPACK_VERSION=4.2" \
				-e "TARGET_OS=Linux" \
				-e "ACCEPT_SDK_LICENCE=accept" \
				-v //var//run//docker.sock://var//run//docker.sock \
				$(REPO):jetpack-sdkmanager

host-jetpack-4.2-deps: jetpack-sdkmanager
	$(DOCKER) run $(DOCKER_RUN_ARGS) \
				--rm \
				-it \
				-e "DOCKER=$(DOCKER)" \
				-e "DEVICE_ID=host" \
				-e "DEVCIE_OPTION=--host" \
				-e "NV_USER=$(NV_USER)" \
				-e "TAG=$(REPO):$@" \
				-e "NV_LOGIN_TYPE=devzone" \
				-e "PRODUCT=Jetson" \
				-e "JETPACK_VERSION=4.2" \
				-e "TARGET_OS=Linux" \
				-e "ACCEPT_SDK_LICENCE=accept" \
				-v //var//run//docker.sock://var//run//docker.sock \
				$(REPO):jetpack-sdkmanager

jetpack-sdkmanager:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/Dockerfile \
					$(CURDIR)

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

