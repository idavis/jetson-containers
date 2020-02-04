#!make

.PHONY: all

all: 32.3.1 32.2.3 32.2.1 32.2.0 32.1


32.3.1: 32.3.1-tx1 32.3.1-jax 32.3.1-jax-8gb 32.3.1-tx2 32.3.1-nano-dev 32.3.1-nano 32.3.1-tx2i 32.3.1-tx2-4gb

32.2.3: 32.2.3-tx1 32.2.3-jax 32.2.3-jax-8gb 32.2.3-tx2 32.2.3-nano-dev 32.2.3-nano 32.2.3-tx2i 32.2.3-tx2-4gb

32.2.1: 32.2.1-tx1 32.2.1-jax 32.2.1-jax-8gb 32.2.1-tx2 32.2.1-nano-dev 32.2.1-nano 32.2.1-tx2i 32.2.1-tx2-4gb

32.2.0: 32.2.0-tx1 32.2.0-jax 32.2.0-tx2 32.2.0-nano-dev 32.2.0-nano 32.2.0-tx2i 32.2.0-tx2-4gb

32.1: 32.1-jax 32.1-tx2 32.1-nano-dev 32.1-tx2i




32.3.1-tx1:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.3.1-tx1-jetpack-4.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.3.1/tx1/Dockerfile

32.3.1-jax:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.3.1-jax-jetpack-4.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.3.1/jax/Dockerfile

32.3.1-jax-8gb:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.3.1-jax-8gb-jetpack-4.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.3.1/jax-8gb/Dockerfile

32.3.1-tx2:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.3.1-tx2-jetpack-4.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.3.1/tx2/Dockerfile

32.3.1-nano-dev:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.3.1-nano-dev-jetpack-4.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.3.1/nano-dev/Dockerfile

32.3.1-nano:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.3.1-nano-jetpack-4.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.3.1/nano/Dockerfile

32.3.1-tx2i:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.3.1-tx2i-jetpack-4.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.3.1/tx2i/Dockerfile

32.3.1-tx2-4gb:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.3.1-tx2-4gb-jetpack-4.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.3.1/tx2-4gb/Dockerfile



32.2.3-tx1:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.3-tx1-jetpack-4.2.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.3/tx1/Dockerfile

32.2.3-jax:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.3-jax-jetpack-4.2.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.3/jax/Dockerfile

32.2.3-jax-8gb:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.3-jax-8gb-jetpack-4.2.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.3/jax-8gb/Dockerfile

32.2.3-tx2:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.3-tx2-jetpack-4.2.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.3/tx2/Dockerfile

32.2.3-nano-dev:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.3-nano-dev-jetpack-4.2.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.3/nano-dev/Dockerfile

32.2.3-nano:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.3-nano-jetpack-4.2.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.3/nano/Dockerfile

32.2.3-tx2i:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.3-tx2i-jetpack-4.2.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.3/tx2i/Dockerfile

32.2.3-tx2-4gb:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.3-tx2-4gb-jetpack-4.2.3-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.3/tx2-4gb/Dockerfile



32.2.1-tx1:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.1-tx1-jetpack-4.2.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.1/tx1/Dockerfile

32.2.1-jax:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.1-jax-jetpack-4.2.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.1/jax/Dockerfile

32.2.1-jax-8gb:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.1-jax-8gb-jetpack-4.2.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.1/jax-8gb/Dockerfile

32.2.1-tx2:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.1-tx2-jetpack-4.2.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.1/tx2/Dockerfile

32.2.1-nano-dev:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.1-nano-dev-jetpack-4.2.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.1/nano-dev/Dockerfile

32.2.1-nano:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.1-nano-jetpack-4.2.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.1/nano/Dockerfile

32.2.1-tx2i:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.1-tx2i-jetpack-4.2.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.1/tx2i/Dockerfile

32.2.1-tx2-4gb:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.1-tx2-4gb-jetpack-4.2.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.1/tx2-4gb/Dockerfile



32.2.0-tx1:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.0-tx1-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.0/tx1/Dockerfile

32.2.0-jax:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.0-jax-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.0/jax/Dockerfile

32.2.0-tx2:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.0-tx2-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.0/tx2/Dockerfile

32.2.0-nano-dev:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.0-nano-dev-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.0/nano-dev/Dockerfile

32.2.0-nano:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.0-nano-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.0/nano/Dockerfile

32.2.0-tx2i:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.0-tx2i-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.0/tx2i/Dockerfile

32.2.0-tx2-4gb:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.2.0-tx2-4gb-jetpack-4.2.1-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.2.0/tx2-4gb/Dockerfile



32.1-jax:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.1-jax-jetpack-4.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.1/jax/Dockerfile

32.1-tx2:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.1-tx2-jetpack-4.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.1/tx2/Dockerfile

32.1-nano-dev:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.1-nano-dev-jetpack-4.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.1/nano-dev/Dockerfile

32.1-tx2i:
	$(DOCKER) build $(DOCKER_DEPS_IMAGE_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					--build-arg DEPENDENCIES_IMAGE=$(REPO):32.1-tx2i-jetpack-4.2-deps \
					-t $(REPO):$@ \
					- < $(CURDIR)/32.1/tx2i/Dockerfile

