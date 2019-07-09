#!make

# Default squash as our base images need to be small unless overridden
DOCKER_BUILD_ARGS ?= --squash

.PHONY: all

all: 32.1 31.1 28.3 28.2.1 28.2 28.1

32.1: $(addprefix 32.1-,jax tx2 jax-tx2 nano)

32.1-jax:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/32.1/jax-tx2/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-tx2:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/32.1/jax-tx2/Dockerfile \
					$(DOCKER_CONTEXT)

32.1-jax-tx2: 32.1-jax 32.1-tx2

32.1-nano:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/32.1/nano/Dockerfile \
					$(DOCKER_CONTEXT)

31.1: $(addprefix 31.1-,jax)

31.1-jax:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/31.1/jax/Dockerfile \
					$(DOCKER_CONTEXT)

28.3: $(addprefix 28.3-,tx2 tx1)

28.3-%:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(XENIAL_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/28.3/$*/Dockerfile \
					$(DOCKER_CONTEXT)

28.2.1: $(addprefix 28.2.1-,tx2)

28.2.1-%:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(XENIAL_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/28.2.1/$*/Dockerfile \
					$(DOCKER_CONTEXT)

28.2: $(addprefix 28.2.1-,tx1)

28.2-%:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(XENIAL_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/28.2/$*/Dockerfile \
					$(DOCKER_CONTEXT)

28.1: $(addprefix 28.1-,tx2 tx1)

28.1-%:
	$(DOCKER) build $(DOCKER_BUILD_ARGS) \
					--build-arg VERSION_ID="$(XENIAL_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/28.1/$*/Dockerfile \
					$(DOCKER_CONTEXT)

