#!make

cti-deps: cti-tx1-deps cti-tx2-deps cti-tx2-4gb-deps cti-tx2i-deps cti-jax-8gb-deps cti-jax-deps cti-nano-deps 

cti-tx1-deps: cti-32.2.1-tx1-deps 
cti-tx2-deps: cti-32.1-tx2-deps cti-32.2.0-tx2-deps cti-32.2.1-tx2-deps 
cti-tx2-4gb-deps: cti-32.2.1-tx2-4gb-deps 
cti-tx2i-deps: cti-32.1-tx2i-deps cti-32.2.0-tx2i-deps cti-32.2.1-tx2i-deps 
cti-jax-8gb-deps: cti-32.2.1-jax-8gb-deps 
cti-jax-deps: cti-32.1-jax-deps cti-32.2.0-jax-deps cti-32.2.1-jax-deps 
cti-nano-deps: cti-32.2.1-nano-deps 



cti-32.2.1-tx1-deps:
	BSP_VERSION=TX1-32.2.1-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX1-32.2.1-V001


cti-32.1-tx2-deps:
	BSP_VERSION=V125 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V125

cti-32.2.0-tx2-deps:
	BSP_VERSION=V126-1 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V126-1

cti-32.2.1-tx2-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004


cti-32.2.1-tx2-4gb-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004


cti-32.1-tx2i-deps:
	BSP_VERSION=V125 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V125

cti-32.2.0-tx2i-deps:
	BSP_VERSION=V126-1 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V126-1

cti-32.2.1-tx2i-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004


cti-32.2.1-jax-8gb-deps:
	BSP_VERSION=AGX-32.2.1-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.2.1-V002


cti-32.1-jax-deps:
	BSP_VERSION=V203 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V203

cti-32.2.0-jax-deps:
	BSP_VERSION=V204 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V204

cti-32.2.1-jax-deps:
	BSP_VERSION=AGX-32.2.1-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.2.1-V002


cti-32.2.1-nano-deps:
	BSP_VERSION=NANO-32.2.1-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-NANO-32.2.1-V001


%-from-folder:
	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$*-deps \
					-f $(CURDIR)/dependencies.Dockerfile \
					$(SDKM_DOWNLOADS)