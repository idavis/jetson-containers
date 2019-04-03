#!make

.PHONY: all

all: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-jetpack-4.2

32.1-jax-jetpack-4.2: $(addprefix 32.1-jax-jetpack-4.2-,base devel runtime)

32.1-jax-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(JAX_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/jax/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-jax-jetpack-4.2-runtime: 32.1-jax-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(JAX_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/jax/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-jax-jetpack-4.2-devel: 32.1-jax-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(JAX_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/jax/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2: $(addprefix 32.1-nano-jetpack-4.2-,base devel runtime)

32.1-nano-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(NANO_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/nano/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2-runtime: 32.1-nano-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(NANO_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/nano/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-nano-jetpack-4.2-devel: 32.1-nano-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(NANO_JP42_URL) \
					-t $(REPO):$@ -f 4.2/nano/devel/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2: $(addprefix 32.1-tx2-jetpack-4.2-,base devel runtime)

32.1-tx2-jetpack-4.2-base:
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(TX2_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/tx2/base/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2-runtime: 32.1-tx2-jetpack-4.2-base
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(TX2_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/tx2/runtime/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2-jetpack-4.2-devel: 32.1-tx2-jetpack-4.2-runtime
	$(DOCKER) build $(DOCKER_ARGS) \
					--build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
					--build-arg URL=$(TX2_JP42_URL) \
					-t $(REPO):$@ \
					-f 4.2/tx2/devel/Dockerfile \
					$(DOCKER_CONTEXT)

