#!make

.PHONY: all

all: 32.1-jetpack-4.2 31.1-jax-jetpack-4.1.1

32.1-jetpack-4.2: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-jetpack-4.2

32.1-jax-jetpack-4.2: $(addprefix 32.1-jax-jetpack-4.2-,base devel runtime)

jax-jetpack-4.2-deps: jetpack-sdkmanager
	$(DOCKER) run $(DOCKER_RUN_ARGS) \
				--rm \
				-it \
				-e "DOCKER=$(DOCKER)" \
				-e "DEVICE_ID=P2888" \
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
					--build-arg URL=$(JAX_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/jax/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-jax-jetpack-4.2-runtime: 32.1-jax-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(JAX_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/jax/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-jax-jetpack-4.2-devel: 32.1-jax-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(JAX_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/jax/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2: $(addprefix 32.1-nano-jetpack-4.2-,base devel runtime)

32.1-nano-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(NANO_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/nano/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2-runtime: 32.1-nano-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(NANO_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/nano/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2-devel: 32.1-nano-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(NANO_JP42_URL) \
					-t $(REPO):$@ -f 4.2/nano/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2: $(addprefix 32.1-tx2-jetpack-4.2-,base devel runtime)

32.1-tx2-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(TX2_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/tx2/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2-runtime: 32.1-tx2-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(TX2_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/tx2/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2-devel: 32.1-tx2-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(TX2_JP42_URL) \
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

