#!make

cti-all-deps: cti-32.1-jax-deps cti-32.1-tx2-deps cti-32.1-tx2i-deps

cti-32.1-jax-deps: $(addsuffix -deps,$(addprefix cti-32.1-jax-,203))

cti-32.1-tx2i-deps: $(addsuffix -deps,$(addprefix cti-32.1-tx2i-,124 125))

cti-32.1-tx2-deps: $(addsuffix -deps,$(addprefix cti-32.1-tx2-,124 125))

cti-32.1-jax-%-deps:
	BSP_VERSION=$* /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V$*

cti-32.1-tx2i-%-deps:
	BSP_VERSION=$* /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V$*

cti-32.1-tx2-%-deps:
	BSP_VERSION=$* /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V$*

%-from-folder:
	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$*-deps \
					-f $(CURDIR)/dependencies.Dockerfile \
					$(SDKM_DOWNLOADS)
